shiro 权限
===
### session问题
+ 用户发起请求时，shiro会先判断本地Ehcache缓存中是否存在该session,  
            //如果有，直接从本地EhCache缓存中读取， 
            //如果没有,在从redis中读取session
                //判断session是否认证通过，如果认证通过将该session缓存到本地EhCache中  
//Redis中，如果Session发生改变，或被删除（用户退出登录），先对Redis中的Session做相应改变（修改或删除）再通过Redis消息通道发布缓存失效消息，通知其他节点EhCache失效  
+ 直接使用redis作为集群中的session共享
+ 采用springSession中http对session的封装
+ springSession默认使用redis进行session共享
### 基于访问路径的请求  
+ session中封装了用户信息和角色信息，没有资源信息，数据信息等，redis中封装了url和对应的权限信息，数据信息，等等，好处在于可以针对url的访问限流，监控等  
### 基于角色的权限  
+ session中封装了用户信息，角色信息，权限信息等，用户登录后全部封装到redis中  
### 权限信息的鉴权是放在了网关部分  
网关作为天然的屏障，可以在网关进行访问控制，限流，规范api的设计，网关有哪些，orange,zuul,kong,zuul 很多东西都需要自己配置；