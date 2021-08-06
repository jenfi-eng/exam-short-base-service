module BaseService
  def self.included(base)
    base.class_eval do
      class << self
        def call(params = {})
          new.tap { |r| r.run(params) }.context
        end

        def call!(params = {})
          new.tap { |r| r.run!(params) }.context
        end
      end

      attr_reader :context
    end
  end

  class Context < OpenStruct
    def initialize
      @failure = false

      super
    end

    def success?
      !failure?
    end

    def failure?
      @failure
    end

    def fail!(data = {})
      data.each { |key, value| self[key] = value }
      @failure = true

      raise Failure.new(self)
    end

    def merge(subservice_context)
      subservice_context.each_pair do |k, v|
        self[k] = v
      end

      return unless subservice_context.failure?

      @failure = true
    end
    alias << merge

    def flash_msg(on_success:)
      if success?
        on_success
      else
        { error: self[:error_sentence] }
      end
    end
  end

  class Failure < StandardError
    attr_reader :context

    def initialize(context = nil)
      @context = context

      super
    end
  end

  def initialize
    @context = Context.new

    after_initialize
  end

  def after_initialize
  end

  def run(params = {})
    run!(params)
  rescue Failure => e
    ensure_failure_rollup(e)
    collect_error_message(e)

    self
  end

  def run!(params = {})
    if params.present?
      params.each { |k, v| @context[k] = v }

      self.call(**params)
    else
      self.call
    end

    context_collect_ar_object_errors

    self
  end

  private

  def ensure_failure_rollup(error)
    return if @context.failure? == true

    @context.instance_variable_set('@failure', true)

    error.context.each_pair do |k, v|
      @context[k] = v
    end
  end

  def context_collect_ar_object_errors
    has_failures = false
    error_sentence = ''
    @context.each_pair do |_, obj|
      next if !obj.is_a?(ApplicationRecord) || obj.errors.blank?

      error_sentence += obj.errors.full_messages.to_sentence
      has_failures = true
    end

    return unless has_failures

    @context.error_sentence = error_sentence
    @context.fail!
  end

  def collect_error_message(error)
    @context.error_sentence = [
      error.context.message,
      error.context.error_sentence,
      @context.error_sentence
    ].uniq.reject(&:blank?).join(' ')
  end
end
