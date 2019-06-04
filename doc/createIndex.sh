# 注意，如果索引建的有问题，则先删除再重新创建索引
curl -XDELETE 'localhost:9200/auditindex'

# 创建索引
curl -XPUT 'http://hadoop100:9200/auditindex?pretty'



# 创建type的mapping信息
curl -H "Content-Type: application/json" -XPOST 'http://hadoop100:9200/auditindex/audittype/_mapping?pretty' -d '
{
"audittype":{
	"properties":{
		"area":{"type":"keyword"},
		"type":{"type":"keyword"},
		"count":{"type":"long"},
		"time":{"type":"date","format": "yyyy-MM-dd HH:mm:ss"}
		}
    }
}
'


