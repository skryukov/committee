require_relative '../../spec_helper'

RSpec.describe OpenAPIParser::Schemas::Paths do
  let(:root) { OpenAPIParser.parse(normal_schema, {}) }

  describe 'correct init' do
    subject { root.paths }

    it do
      expect(subject).not_to be nil
      expect(subject.object_reference).to eq '#/paths'
      expect(subject.root.object_id).to be root.object_id
    end
  end

  describe '#path' do
    subject { paths.path[path_name] }

    let(:paths) { root.paths }
    let(:path_name) { '/characters' }

    it do
      expect(subject).not_to eq nil
      expect(subject.kind_of?(OpenAPIParser::Schemas::PathItem)).to eq true
    end
  end
end
