requests发送xml格式内容  
基于python3.6
<!-- more -->

demo如下
```python
headers = {'Content-type': 'text/xml'}
xml = '<?xml version="1.0" encoding="utf-8"?>' \
          '<Packet>' \
          '<Head>' \
          '<isUp>1</isUp>' \
          '<isBatch>0</isBatch>' \
          '<serType>sms</serType>' \
          '</Head>' \
          '<Body>' \
          '<Task>' \
          '</Task>' \
          '</Body>' \
          '</Packet>'
    res = requests.post(SMS_URL, headers=headers, data=xml.encode('utf-8'), veriy=alse)
```

总共有两点要注意的
1. xml的文本不包含回车，即不可以用以下的代码
```python
xml = '''<?xml version="1.0" encoding="utf-8"?>
          <Packet>
          <Head>
          </Head>
          <Body>
          <Task>
          </Task>
          </Body>
          </Packet>'''
```
2. 整体进行ut-8的encode，即xml.encode('utf-8')