# 脚本模板

> 示例仓库：https://github.com/donknap/dpanel-script-template

用户自定义的脚本模板位于 /dpanel/script 目录中，该目录下的包含多个子目录，每一个子目录表示一组脚本模板。

```
/dpanel/script
├─ /template-1                  # template-1 脚本组
│  ├─ /script-1         
│  │  └─ data.yaml 
│  ├─ /script-2        
│  │  └─ data.yaml
│  ├─ /script-3              
│  │  └─ data.yml
│  └─ ... 
└─ ....
```

### 数据定义规范

```yaml
task: 
  # 脚本名称
  name: container-backup
   # 脚本中文介绍
  descriptionZh: |
    备份容器中存储卷或是挂载目录  
  # 脚本英文介绍
  descriptionEn: | 
    Backup the mount directory or volume in the container
  # 执行的脚本，包含环境变量名，可以换行
  script: |  
    BACKUP_FILE_NAME=${CONTAINER_NAME}_$(date +"%Y%m%d%H%M%S").tar
    docker run -it --rm --name dpanel-task-backup \
    --volumes-from ${CONTAINER_NAME} \
    -v ${BACKUP_PATH}:/backup busybox \
    tar czvf /backup/${BACKUP_FILE_NAME} ${CONTAINER_NAME}
    echo "备份完成，备份文件位于: ${BACKUP_PATH}/${BACKUP_FILE_NAME}"
  # 自定义的一些 tag，包含 run-in-dpanel 表示该脚本需要在容器面板中执行
  tag:  
    - dpanel
    - run-in-dpanel
  # 脚本中用到的环境变量
  environment: 
    - name: CONTAINER_NAME
      labelZh: 容器名称
      labelEn: container name
    - name: BACKUP_PATH
      labelZh: 备份到主机目录
      labelEn: host backup path
```