require 'actions_spec_helper'

module Topics
  describe DisplayTopics do
    subject(:action) { DisplayTopics.new }
    let(:reader_factory) { double :reader_factory, new: nil }
    let(:reader) { double :reader, call: results }
    let(:results) { nil }

    before { action.reader_factory = reader_factory }

    describe 'call' do
      context 'with no topics in the system' do
        let(:results) { [] }
        before { reader_factory.stub(:new).with({}).and_return(reader) }

        it 'yields a success response' do
          expect { |b| action.call { |response| response.success(&b) } }.to yield_control
        end

        it 'has an empty array in the response context' do
          expect(action.call {|response| response}.context).to eq []
        end
      end

      context 'with a topic in the system' do
        let(:topic) { double :topic }
        let(:results) { [topic] }
        before { reader_factory.stub(:new).with({}).and_return(reader) }

        it 'yields a success response' do
          expect { |b| action.call { |response| response.success(&b) } }.to yield_control
        end

        it 'has an array with a single topic' do
          expect(action.call {|response| response}.context).to eq [topic]
        end
      end
    end
  end
end
