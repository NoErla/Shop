jQuery.validator.addMethod("isPhone", function(value, element, param) {
	var tel = /^1[0-9]{10}$/;
	return this.optional(element) || (tel.test(value));
}, $.validator.format("请填写正确的手机号"));

jQuery.validator.addMethod("isNumOrLetter", function(value, element) {
	var numOrLetter = /^[0-9a-zA-Z]*$/;
	return this.optional(element) || (numOrLetter.test(value));
}, "必须输入字母或数字");

jQuery.validator.addMethod("isIdcard", function(value, element) {
	var idcard = /^[0-9]{17}[0-9Xx]{1}$/;
	return this.optional(element) || (idcard.test(value));
}, $.validator.format("请输入正确的身份证号码"));

jQuery.validator.addMethod("isNumOrLetterOrChinese", function(value, element) {
	var chinese = /^[\u4e00-\u9fa5a-zA-Z0-9]+$/;
	return this.optional(element) || (chinese.test(value));
}, "必须输入汉字或英文字母或数字");