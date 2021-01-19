class SourceCreateTaskService < TaskService
  def process
    return if ENV["SOURCE_TYPE_ID"].blank? || ENV["SOURCE_TYPE_ID"] != @options[:source_type_id]

    Source.create!(source_options)
  end

  private

  def source_options
    {}.tap do |options|
      options[:tenant_id] = tenant.id
      options[:id] = @options[:source_id]
      options[:uid] = @options[:source_uid]
    end
  end
end