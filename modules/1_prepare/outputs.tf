################################################################
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Licensed Materials - Property of IBM
#
# ©Copyright IBM Corp. 2020
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################

output "bastion_internal_ip" {
    depends_on = [null_resource.bastion_init]
    value = data.ibm_pi_instance_ip.bastion_public_ip.*.ip
}

output "bastion_public_ip" {
    depends_on = [null_resource.bastion_packages]
    value = data.ibm_pi_instance_ip.bastion_public_ip.*.external_ip
}

output "cidr" {
    value = ibm_pi_network.public_network.pi_cidr
}

output "public_cidr" {
    value = ibm_pi_network.public_network.pi_cidr
}

output "bastion_internal_vip" {
    depends_on  = [null_resource.bastion_init]
    value       = local.bastion_count > 1 ? ibm_pi_network_port.bastion_internal_vip[0].pi_network_port_ipaddress : ""
}

output "bastion_external_vip" {
    depends_on  = [null_resource.bastion_init]
    value       = local.bastion_count > 1 ? ibm_pi_network_port.bastion_internal_vip[0].public_ip : ""
}
