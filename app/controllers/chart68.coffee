ChartBase = require("controllers/chart4")
# 各消费金额区间的刷卡量分析
class Chart68 extends ChartBase
	opts:
		h_ser: ["2000以下", "2000-5000", "5000-10000", "10000-50000", "50000-100000", "100000-200000", "200000以上"]
		h_label: '金额区间(万元）'
		v_ser: [18175255,4132534,1929648,1777871,233999,116951,118936]
		v_label: '银行卡(卡)'
		labelColor: '#DE2A23'
		colors: ["#DE2A23","#DE2A23"]
module.exports = Chart68