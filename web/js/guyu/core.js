/**
 * 常用方法的核心
 */
var guyu = (function($, window) {

	var _apiUrl = config.localApi;
	switch (config.deployMode) {
		case "distributed":
			_apiUrl = config.localApi;
			break;
		case "nodistributed":
			_apiUrl = config.remoteApi;
			break;
		default:
			_apiUrl = config.localApi;
			break;
	}

	var self = this;
	self.apiUrl = _apiUrl;
	self.webUrl = config.webUrl;
	self.sysName = config.sysName;;
	self.unitSign = config.unitSign;
	self.deployMode = config.deployMode;
	self.runMode = config.runMode;
	
	// 输出日志信息
	self.log = function(msg) {
		if (window["console"]) {
			if (self.runMode == "test") {
				console.log(msg);
			}
		}
	}

	self.getUrlParams = function getUrlParams(params) {
		var url = params || location.search; // 获取url中"?"符后的字串
		var theRequest = new Object();
		if (url.indexOf("?") != -1) {
			var str = url.substr(url.indexOf("?") + 1);
			strs = str.split("&");
			for (var i = 0; i < strs.length; i++) {
				theRequest[strs[i].split("=")[0]] = decodeURI(strs[i].split("=")[1]);
			}
		}
		return theRequest;
	}

	/**
	 * 返回
	 */
	self.backClick = function backClick() {
		$subframe = $(".subframe-box", parent.document);
		$maincontent = $(".main-content-inner", parent.document);
		if ($subframe.length > 0) {
			$subframe.hide();
			$maincontent.show();

			if ($(window.parent.document).find(".btn-g-query")[0] != undefined) {
				// 触发刷新
				$(window.parent.document).find(".btn-g-query")[0].click();
			}
			if (window.parent.returnRefresh != undefined) {
				window.parent.returnRefresh();
			}
			/* self.autoIframeHeight(); */
		} else {
			window.history.go(-1);
		}
	}

	/**
	 * 自动设置ifame高度
	 */
	self.autoIframeHeight = function($frame) {

		if ($frame.length > 0) {
			var height = parseInt($(".main-content-inner", $(document)).height()) + 50;
			$frame.attr("style", "height:" + height + "px;width:100%;z-index:100;position: relative;");
		}
	}
})(jQuery, window)
	
/**
 * 分页插件
 * 
 * @param {Object}
 *            opt : opt.container: 分页div id opt.pageIndex: 当前页
 *            opt.pageSize:每页显示数量
 * @param {Object}
 *            viewModel 列表视图模型
 */
guyu.page = function(opt, viewModel) {

	var $container;
	var koViewModel;
	var option = {
		pageIndex: 1,
		pageSize: 10
	}

	/**
	 * 初始化
	 * 
	 * @param {Object}
	 *            $element
	 * @param {Object}
	 *            viewModel boolget:是否获取数据
	 */
	this.init = function init(boolGet) {
		if (opt != undefined) {
			$container = $("#" + opt["container"]);
			this.container = $("#" + opt["container"]);
			if (opt["pageIndex"] != undefined) {
				option["pageIndex"] = opt["pageIndex"];
			}
			if (opt["pageSize"] != undefined) {
				option["pageSize"] = opt["pageSize"];
			}
		} else {
			// console.log("请设置初始化参数");
			return false;
		}
		var html = new Array();
		html.push('<div class="dataTables_paginate paging_simple_numbers">');
		html.push('<ul class="pagination">');
		html.push('<li><a href="javascript:void(0)" class="p-first">首页</a></li>');
		html.push('<li><a href="javascript:void(0)" class="p-prev">上一页</a></li>');
		html.push('<li><span class="input-box"><input type="text" class="p-index" value="1"></span><a href="javascript:void(0)" class="p-go">跳转</a></li>');
		html.push('<li><a href="javascript:void(0)" class="p-next">下一页</a></li>');
		html.push('<li><a href="javascript:void(0)" class="p-last">尾页</a></li>');
		html.push('<li><span>共<font color="red" class="p-totalPage">1/1</font> 页<font color="red" class="p-total">0</font>条</span></li>');
		html.push('</ul></div>');
		$container.html(html.join(''));
		this.setViewModel(viewModel);

		if (boolGet) {
			getData();
		}

		$(".p-first", $container).click(firstPage);
		$(".p-prev", $container).click(prevPage);
		$(".p-next", $container).click(nextPage);
		$(".p-last", $container).click(lastPage);
		$(".p-go", $container).click(goPage);
		$(".p-index", $container).change(checkPageIndex);

	}

	this.setViewModel = function(viewModel) {
		if (viewModel != undefined) {
			koViewModel = viewModel;
			option.pageIndex = viewModel.page().pageIndex()==undefined ? 1 :  viewModel.page().pageIndex();
			option.pageSize = viewModel.page().pageSize()==undefined ? 1 :  viewModel.page().pageSize();
			option.total = viewModel.page().total()==undefined ? 0 :  viewModel.page().total();
			// if(option.pageIndex==undefined || option.pageSize==undefined ||
			// option.total==undefined)
			$(".p-index", $container).val(option.pageIndex);
			var totalPage = Math.ceil(option.total / option.pageSize);
			$(".p-totalPage", $container).html(option.pageIndex + "/" + totalPage);
			$(".p-total", $container).html(option.total);
			// getData();
		}
	}

	// 首页
	function firstPage() {
		option.pageIndex = 1;
		getData();
	}

	// 尾页
	function lastPage() {
		var totalPage = Math.ceil(option.total / option.pageSize);
		option.pageIndex = totalPage;
		getData();
	}

	// 上一页
	function prevPage() {
		if (option.pageIndex > 1) {
			option.pageIndex--;
			getData();
		}
	}

	// 下一页
	function nextPage() {
		var totalPage = Math.ceil(option.total / option.pageSize);
		if (option.pageIndex < totalPage) {
			option.pageIndex++;
			getData();
		}
	}

	// 跳转
	function goPage() {
		checkPageIndex();
		var index = $(".p-index", $container).val();
		option.pageIndex = index;
		getData();
	}

	/**
	 * 获取数据
	 */
	function getData() {
		$(".p-index", $container).val(option.pageIndex);
		var totalPage = Math.ceil(option.total / option.pageSize);
		$(".p-totalPage", $container).html(option.pageIndex + "/" + totalPage);
		$(".p-total", $container).html(option.total);
		koViewModel.page().pageIndex(option.pageIndex);
		koViewModel.getData();
	}

	/**
	 * 验证 pageIndex
	 */
	function checkPageIndex() {
		var pageIndex = $(".p-index", $container).val();
		var t = /^\d+(\.\d+)?$/;
		if (!t.test(pageIndex)) {
			pageIndex = 1;
		}
		var totalPage = Math.ceil(option.total / option.pageSize);
		if (pageIndex > totalPage) {
			if (totalPage == 0) {
				pageIndex = 1;
			} else {
				pageIndex = totalPage;
			}
		}
		$(".p-index", $container).val(pageIndex);
	}
	return this;
};

guyu.editor = function(element) {

	// 初始化编辑器
	$('#' + element).ace_wysiwyg({
		toolbar: [
			'font',
			null,
			'fontSize',
			null, {
				name: 'bold',
				className: 'btn-info'
			}, {
				name: 'italic',
				className: 'btn-info'
			}, {
				name: 'strikethrough',
				className: 'btn-info'
			}, {
				name: 'underline',
				className: 'btn-info'
			},
			null, {
				name: 'insertunorderedlist',
				className: 'btn-success'
			}, {
				name: 'insertorderedlist',
				className: 'btn-success'
			}, {
				name: 'outdent',
				className: 'btn-purple'
			}, {
				name: 'indent',
				className: 'btn-purple'
			},
			null, {
				name: 'justifyleft',
				className: 'btn-primary'
			}, {
				name: 'justifycenter',
				className: 'btn-primary'
			}, {
				name: 'justifyright',
				className: 'btn-primary'
			}, {
				name: 'justifyfull',
				className: 'btn-inverse'
			},
			null, {
				name: 'createLink',
				className: 'btn-pink'
			}, {
				name: 'unlink',
				className: 'btn-pink'
			},
			null, {
				name: 'insertImage',
				className: 'btn-success'
			},
			null,
			'foreColor',
			null, {
				name: 'undo',
				className: 'btn-grey'
			}, {
				name: 'redo',
				className: 'btn-grey'
			}
		],
		'wysiwyg': {
			fileUploadError: showErrorAlert
		}
	}).prev().addClass('wysiwyg-style2');

	function showErrorAlert(reason, detail) {
		var msg = '';
		if (reason === 'unsupported-file-type') {
			msg = "Unsupported format " + detail;
		} else {
			// console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
			'<strong>File upload error</strong> ' + msg + ' </div>').prependTo('#alerts');
	}
}


/**
 * 页面跳转
 * 
 * @param {Object}
 *            url
 */

guyu.mobile.goUrl=function(url){
	window.top.location=url;
}

// 加载 显示加载界面
guyu.pageLoading=function(){
	var target=$("#fakeLoader").fakeLoader({
            spinner:"spinner2"
    });
    // $("#fakeLoader").fadeOut();
    return target;
}


