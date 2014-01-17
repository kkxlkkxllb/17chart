ChartBase = require("controllers/chart33")
# 流失客户在同行业其他商户的月消费情况
class Chart57 extends ChartBase
	opts:
		h_ser: ['8月','9月','10月']
		h_label: '月份'
		v_ser: [{color: '#EBAA00', y: 1.8}, {color:"#ADCF32", y:1.9}, {color:"#507205", y: 1.8}]
		v_label: '刷卡量（笔）'

module.exports = Chart57
