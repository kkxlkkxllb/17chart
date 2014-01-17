ChartBase = require("controllers/chart33")
# 流失客户在同行业其他商户的月消费情况
class Chart58 extends ChartBase
	opts:
		h_ser: ['8月','9月','10月']
		h_label: '月份'
		v_ser: [{color: '#EBAA00', y: 1282.5}, {color:"#ADCF32", y:1668.8}, {color:"#507205", y: 1604.3}]
		v_label: '消费金额（元/人）'

module.exports = Chart58
