# SSDB Base Env

一个简单的环境, 带个启动脚本

- src/ SSDB 服务源码
- runtime/ 运行环境, 包括 pid 和 dataset
- logs/ 各种 log

## Usage

```bash
git clone git@github.com:rcrai/ssdb_base_env.git --recurse-submodules /path/to/ssdb
cd /path/to/ssdb/src
make
cd /path/to/ssdb
./start_ssdb_$profile.sh
```

