const fetch = require('node-fetch');
const fs = require('fs');

let url = "https://diqu.gezhong.vip/api.php"

let settings = { method: "Get" };

fetch(url, settings)
    .then(res => res.json())
    .then((json) => {
	   let data = JSON.stringify(json);
fs.writeFileSync('/etc/xxx/a.json', data);
        // do something with JSON
    });
