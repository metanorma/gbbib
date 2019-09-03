require "relaton_gb/gb_scrapper"

RSpec.describe RelatonGb::Scrapper do
  it "returns status published" do
    doc = Nokogiri::HTML <<~END_HTML
      <html>
        <body>
          <table>
            <tr>
              <td>标准状态<span>即将实施</span></td>
            </tr>
          </table>
        </body>
      </html>
    END_HTML
    status = RelatonGb::GbScrapper.get_status doc
    expect(status.stage).to eq "published"
  end

  it "returns guidelines" do
    expect(RelatonGb::GbScrapper.send(:get_mandate, "DB11/Z 610-2008")).to eq "guidelines"
  end

  it "returns mandatory" do
    expect(RelatonGb::GbScrapper.send(:get_mandate, "GB 19855-2005")).to eq "mandatory"
  end

  it "returns scope sector" do
    doc = Nokogiri::HTML <<~END_HTML
      <html>
        <body>
          <div>发布单位</div>
          <div>行业标准</div>
        </body>
      </html>
    END_HTML

    expect(RelatonGb::GbScrapper.send(:get_scope, doc)).to eq "sector"
  end
end
