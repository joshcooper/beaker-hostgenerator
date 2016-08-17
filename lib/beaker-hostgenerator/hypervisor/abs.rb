require 'beaker-hostgenerator/hypervisor'
require 'beaker-hostgenerator/data'
require 'deep_merge'

module BeakerHostGenerator
  module Hypervisor
    class Abs < BeakerHostGenerator::Hypervisor::Interface
      include BeakerHostGenerator::Data

      def generate_node(node_info, base_config, bhg_version)
        base_config['hypervisor'] = 'abs'

        platform = node_info['platform']
        platform_info = get_platform_info(bhg_version, platform, :vmpooler)
        base_config.deep_merge! platform_info

        return base_config
      end
    end
  end
end
