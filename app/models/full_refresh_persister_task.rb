class FullRefreshPersisterTask < KafkaMessageTask
  after_update_commit :post_persister_task, :if => proc { state == 'completed' }

  def post_persister_task
    PostPersisterTaskService.new(service_options).process
  end
end
