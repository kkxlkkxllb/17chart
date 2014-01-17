ChartBase = require("controllers/chart33")
# 流失客户在同行业其他商户的月消费情况
class Chart17 extends ChartBase
	opts:
		h_ser: ['8月','9月','10月']
		h_label: '月份'
		v_ser: [{color: '#EBAA00', y: 5412047}, {color:"#EA5514", y:7877659}, {color:"#E60012", y: 11186082}]
		v_label: '消费金额(元)'

module.exports = Chart17
