ChartBase = require("controllers/chart33")
# 流失客户在同行业其他商户的月消费情况
class Chart52 extends ChartBase
	opts:
		h_ser: ['8月','9月','10月']
		h_label: '月份'
		v_ser: [{color: '#EBAA00', y: 1173.6}, {color:"#EA5514", y:1576.4}, {color:"#E60012", y: 1450.0}]
		v_label: '消费金额（元/人）'

module.exports = Chart52
