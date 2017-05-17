require "spec_helper"

RSpec.describe Reversepoddependency do

  it "has a version number" do
    expect(Reversepoddependency::VERSION).not_to be nil
  end

  it "does something useful" do
    podSource = Reversepoddependency::SepcAnalyse.new('/Users/qiaozhiguang/.cocoapods/repos/sankuai-ios-binaryspecs','SAKAnalytics')
    resultHash = podSource.getAnalyseResult
	
    puts "all Main Pods ,not contain Subspec"
    puts "-----------------------------------"
	resultHash.each {|key,value|
    	puts key
    }
    puts "\n"
    puts "all pods ,contain Subspec"
    puts "-----------------------------------"
    resultHash.each {|key,value|
    	puts "#{key}->"
    	puts value
    	puts '---'
    }


    expect(resultHash.count).not_to eq(0)
  end

end
