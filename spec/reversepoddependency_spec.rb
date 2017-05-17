require "spec_helper"

RSpec.describe Reversepoddependency do

  it "has a version number" do
    expect(Reversepoddependency::VERSION).not_to be nil
  end

  it "does something useful" do
    podSource = Reversepoddependency::SepcAnalyse.new('/Users/qiaozhiguang/.cocoapods/repos/sankuai-ios-binaryspecs','SankuaiKit')
    resultArr = podSource.getAnalyseResult
    puts resultArr
    expect(resultArr.count).not_to eq(0)
  end

end
