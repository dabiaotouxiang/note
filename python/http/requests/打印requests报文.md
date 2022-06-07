```
from requests_toolbelt.utils.dump import dump_all
resp = self.session.post(sensor_url, headers=headers, json=data, timeout=(30, 30))
data = dump_all(resp)
print(data.decode('utf-8'))
```