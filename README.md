# Docker Engine API for LuCI

This is a simple Docker Engine API for LuCI, Now we can operating Docker in LuCI by this lib.

QUICK START:
```lua
local docker = require "luci.docker"
d = docker.new()
response_str = d.containers:list("container_name") 
--[[
-- if operate container, just using: d:list("container_name")
-- return an response(table type) like this:
{
  message = OK
  protocol = HTTP/1.1
  code = 200
  headers = {
    Ostype = linux
    Content-Type = application/json
    Api-Version = 1.40
    Connection = close
    Date = Tue, 24 Sep 2019 03:22:03 GMT
    Content-Length = 786
    Docker-Experimental = false
    Server = Docker/19.03.1 (linux)
  }
  body = {
    1 = {
      Created = 1569234629
      Id = 611e39220db324d38bfae8cdc6bc5bff15095bd4c15d2c3a7d18b193ddfc0ccf
      Mounts = {
      }
      Status = Up 17 hours
      Names = {
        1 = /docker_api_test
      }
      State = running
      Image = alpine
      NetworkSettings = {
        Networks = {
          bridge = {
            NetworkID = 9ee156d0a5ea578cbb45d38491452bb0f5c57bf477008240b0c6784c25363607
            IPAddress = 172.17.0.6
            MacAddress = 02:42:ac:11:00:06
            IPPrefixLen = 16
            IPv6Gateway =
            Gateway = 172.17.0.1
            GlobalIPv6PrefixLen = 0
            EndpointID = ec540182d3fd8fed3d88eabd6bc4113f69e3eaef2fc057d7752ea282e5cad15b
            GlobalIPv6Address =
          }
        }
      }
      HostConfig = {
        NetworkMode = default
      }
      Command = sh
      ImageID = sha256:cdf98d1859c1beb33ec70507249d34bacf888d59c24df3204057f9a6c758dddb
      Ports = {
      }
      Labels = {
      }
    }
  }
}
]]
response = d.containers:list(nil, request_qurey)
response = d.containers:create("container_name", request_qurey, request_body)
response = d.networks:list()
response = d:logs("filebrowser", {stdout=1})
--[[

{
  message = OK
  protocol = HTTP/1.1
  code = 200
  headers = {
    Ostype = linux
    Api-Version = 1.40
    Transfer-Encoding = chunked
    Date = Tue, 24 Sep 2019 03:23:31 GMT
    Connection = close
    Docker-Experimental = false
    Server = Docker/19.03.1 (linux)
  }
  body = stdout: 2019/06/29 07:27:16 Listening on [::]:80
stdout: 2019/06/29 07:48:19 Caught signal terminated: shutting down.
stdout: 2019/06/29 07:48:21 Listening on [::]:80
stdout: 2019/06/29 14:25:13 /api/login: 403 10.1.1.25:45780 <nil>
stdout: 2019/06/29 23:15:17 /api/renew: 403 10.1.1.186:49468 <nil>
stdout: 2019/06/30 02:58:02 Caught signal terminated: shutting down.
stdout: 2019/06/30 03:06:23 Listening on [::]:80
stdout: 2019/06/30 03:10:02 Caught signal terminated: shutting down.
stdout: 2019/06/30 03:10:02 accept tcp [::]:80: use of closed network connection
stdout: 2019/06/30 03:10:49 Listening on [::]:80
stdout: 2019/07/01 11:06:34 /api/renew: 403 10.1.1.192:15748 <nil>
stdout: 2019/07/05 07:32:16 Caught signal terminated: shutting down.
stdout: 2019/07/05 07:32:33 Listening on [::]:80
stdout: 2019/08/01 07:01:18 Caught signal terminated: shutting down.
stdout: 2019/08/01 07:03:32 Listening on [::]:80
stdout: 2019/08/26 11:00:19 Listening on [::]:80
stdout: 2019/08/26 11:29:56 /api/renew: 403 10.1.1.110:3301 <nil>
stdout: 2019/08/26 11:30:00 /api/login: 403 10.1.1.110:3301 <nil>
stdout: 2019/08/26 11:30:06 /api/login: 403 10.1.1.110:3301 <nil>
stdout: 2019/08/26 11:30:08 /api/login: 403 10.1.1.110:3301 <nil>
stdout: 2019/08/26 11:30:10 /api/login: 403 10.1.1.110:3301 <nil>
stdout: 2019/08/31 04:34:28 /api/renew: 403 10.1.1.202:61574 <nil>
stdout: 2019/09/11 05:24:40 /api/login: 403 39.171.135.94:2847 <nil>
stdout: 2019/09/12 12:57:05 /api/renew: 403 10.1.1.216:35818 <nil>

}

]]
.....
```

`request_qurey` `request_body` Parameters: https://docs.docker.com/engine/api