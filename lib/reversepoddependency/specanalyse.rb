require 'cocoapods-core'

module Reversepoddependency

	class SepcAnalyse
		def initialize(repoPath,targetPodName)
			@repoPath = repoPath
			@targetPodName = targetPodName
			@podSource = Pod::Source.new(repoPath)
		end

		def getAnalyseResult
			puts '正在分析' + @podSource.name + '...'
			resultArr = Array.new
			@podSource.pods.collect do |podName|
				if self.isSpecDependentTargetPod(self.getHighVersionSpec(podName)) == 1
					resultArr.push(podName)
				end
			end
			return resultArr
		end

		def getHighVersionSpec(podName)
			highVersion = @podSource.versions(podName).first
			return @podSource.specification(podName,highVersion)
		end

		def isSpecDependentTargetPod(spec)
			spec.dependencies.each do |dependedPod|
				if dependedPod.name == @targetPodName
					return 1
				end
				return 0
			end
		end
	end
end