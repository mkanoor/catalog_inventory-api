describe CloudConnectorService do
  include ::Spec::Support::TenantIdentity

  let(:subject) { described_class.new(params) }
  let(:task) { FactoryBot.create(:task, :source => source, :tenant => tenant) }
  let(:source) { FactoryBot.create(:source, :enabled => true, :tenant => tenant) }
  let(:task_id) { task.id }

  describe "#initialize" do
    let(:params) { {"task_id" => task_id, "task_url" => "url", "cloud_connector_url" => "m_url", "cloud_connector_id" => "guid"} }

    it "returns service" do
      expect(subject.class).to eq(CloudConnectorService)
    end
  end

  shared_examples_for "options keys check" do |key|
    context "when options key is missing" do
      let(:options) { {"task_id" => task_id, "task_url" => "url", "cloud_connector_url" => "m_url", "cloud_connector_id" => "guid"} }
      let(:params) { options.except(key) }

      it "raise exception" do
        expect { subject }.to raise_error("Options must have task_id, task_url, cloud_connector_url and cloud_connector_id keys")
      end
    end
  end

  ["task_id", "task_url", "cloud_connector_url", "cloud_connector_id"].each do |key|
    it_behaves_like "options keys check", key
  end
end
