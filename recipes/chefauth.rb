#
# Cookbook Name:: tfchefint
# Recipe:: chefauth
#
# Copyright 2013, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

dotchef = node['tfchefint']['chefauth']['sf-admin-home'] + ::File::Separator + '.chef'

directory dotchef do
  owner "sf-admin"
  group "sf-admin"
  mode  00700
  action :create
end

template "#{dotchef}/knife.rb" do
  source "knife.rb.erb"
  owner "sf-admin"
  group "sf-admin"
  mode  00600
  action :create
end

unless ::File.exists?(dotchef + ::File::Separator + 'sf-admin.pem') then
  Chef::Log.warn("Remember to put sf-admin.pem into " + dotchef)
end