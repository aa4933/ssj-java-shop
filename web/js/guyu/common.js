/**
 * 公共方法
 */

//knockout.js 日期扩展
ko.bindingHandlers.datepicker = {
    init: function (element, valueAccessor, allBindingsAccessor) {
        var options = allBindingsAccessor().datepickerOptions || {};
        $(element).datepicker(options).on("changeDate", function (ev) {
            var observable = valueAccessor();
            observable(ev.date);
        });
    },
    update: function (element, valueAccessor) {
        var value = ko.utils.unwrapObservable(valueAccessor());
        if(value!=undefined){
        	 var format=$(element).attr("data-moment-format")==undefined?"YYYY-MM-DD":$(element).attr("data-moment-format");
        	 value=moment(value).format(format);
             $(element).datepicker("setDate", value);
        }
       
    }
};


//日期
$('.date-picker').datepicker({
    language: 'zh-CN',
    autoclose: true,
    todayHighlight: true
}).next().on(ace.click_event, function(){
	$(this).prev().focus(); 
});


