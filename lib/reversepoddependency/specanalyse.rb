require 'cocoapods-core'

module Reversepoddependency

	class SepcAnalyse
		def initialize(repoPath,targetPodName)
			@repoPath = repoPath
			@targetPodName = targetPodName
			@podSource = Pod::Source.new(repoPath)
		end

		def getAnalyseResult
			if @podSource.git?
				puts "update repo #{@podSource.name}"
				@podSource.update(true)
			end
			puts "正在分析 #{@targetPodName} 在 #{@podSource.name} 中的被依赖列表  ...\n"
			resultHasn = Hash.new
			@podSource.pods.collect do |podName|
				podspecHighV = self.getHighVersionSpec(podName)
				tmpArr = []
				if self.isSpecDependentTargetPod(podspecHighV) == 1
					tmpArr.push(podName)
				end

				podspecHighV.subspecs.each do |subspec|
					if self.isSpecDependentTargetPod(subspec) == 1
						tmpArr.push(subspec.name)
					end
				end
				if tmpArr.count > 0
					resultHasn[podName] = tmpArr
				end
			end
			return resultHasn
		end

		def getHighVersionSpec(podName)
			highVersion = @podSource.versions(podName).first
			return @podSource.specification(podName,highVersion)
		end

		def isSpecDependentTargetPod(spec)
			spec.dependencies.each do |dependedPod|
				if dependedPod.name.include?(@targetPodName)
					return 1
				end
			end
			return 0
		end
	end
end