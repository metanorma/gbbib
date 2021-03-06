RSpec.describe RelatonGb::HitCollection do
  subject { RelatonGb::HitCollection.new }

  it "returns string" do
    expect(subject.to_s).to eq(
      "<RelatonGb::HitCollection:#{format('%<id>#.14x', id: subject.object_id << 1)} "\
      "@ref= @fetched=false>",
    )
  end
end
