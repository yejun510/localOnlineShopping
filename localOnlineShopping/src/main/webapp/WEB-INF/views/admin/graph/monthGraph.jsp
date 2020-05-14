<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.mtz-monthpicker{
	color: black;
	}
</style>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/ui-lightness/jquery-ui.css"
	type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
function initDatePickers() {
	  // monthpicker and year selector start/end year (10 year ago)
	  var currentYear = (new Date()).getFullYear();
	  var startYear = currentYear - 5;

	  var options = {
	    startYear: startYear,
	    finalYear: currentYear,
	    pattern: 'yy/mm',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	  };

	  $('#schMonth').monthpicker(options);
	}

	$(function() {;
	  (function($) {
		 	var mon = '${month}'
		 	var yea = mon.split('/');
		 	
		 	
	    var methods = {
	      init: function(options) {
	        return this.each(function() {
	          var
	            $this = $(this),
	            data = $this.data('monthpicker'),
	            year = (options && options.year) ? options.year : (new Date()).getFullYear(),
	            settings = $.extend({
	              pattern: 'mm/yyyy',
	              selectedMonth: null,
	              selectedMonthName: '',
	              selectedYear: year,
	              startYear: year - 10,
	              finalYear: year + 10,
	              monthNames: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
	              id: "monthpicker_" + (Math.random() * Math.random()).toString().replace('.', ''),
	              openOnFocus: true,
	              disabledMonths: []
	            }, options);

	          settings.dateSeparator = settings.pattern.replace(/(mmm|mm|m|yyyy|yy|y)/ig, '');

	          // If the plugin hasn't been initialized yet for this element
	          if (!data) {

	            $(this).data('monthpicker', {
	              'target': $this,
	              'settings': settings
	            });

	            if (settings.openOnFocus === true) {
	              $this.on('focus', function() {
	                $this.monthpicker('show');
	              });
	            }

	            $this.monthpicker('parseInputValue', settings);

	            $this.monthpicker('mountWidget', settings);

	            $this.on('monthpicker-click-month', function(e, month, year) {
	              $this.monthpicker('setValue', settings);
	              $this.monthpicker('hide');
	            });

	            // hide widget when user clicks elsewhere on page
	            $this.addClass("mtz-monthpicker-widgetcontainer");
	            $(document).unbind("mousedown.mtzmonthpicker").on("mousedown.mtzmonthpicker", function(e) {
	              if (!e.target.className || e.target.className.toString().indexOf('mtz-monthpicker') < 0) {
	                $(this).monthpicker('hideAll');
	              }
	            });
	          }
	        });
	      },

	      show: function() {
	        $(this).monthpicker('hideAll');
	        var widget = $('#' + this.data('monthpicker').settings.id);
	        widget.css("top", this.offset().top + this.outerHeight());
	        if ($(window).width() > (widget.width() + this.offset().left)) {
	          widget.css("left", this.offset().left);
	        } else {
	          widget.css("left", this.offset().left - widget.width());
	        }
	        widget.show();
	        widget.find('select').focus();
	        this.trigger('monthpicker-show');
	      },

	      hide: function() {
	        var widget = $('#' + this.data('monthpicker').settings.id);
	        if (widget.is(':visible')) {
	          widget.hide();
	          this.trigger('monthpicker-hide');
	        }
	      },

	      hideAll: function() {
	        $(".mtz-monthpicker-widgetcontainer").each(function() {
	          if (typeof($(this).data("monthpicker")) != "undefined") {
	            $(this).monthpicker('hide');
	          }
	        });
	      },

	      setValue: function(settings) {
	        var
	          month = settings.selectedMonth,
	          year = settings.selectedYear;

	        if (settings.pattern.indexOf('mmm') >= 0) {
	          month = settings.selectedMonthName;
	        } else if (settings.pattern.indexOf('mm') >= 0 && settings.selectedMonth < 10) {
	          month = '0' + settings.selectedMonth;
	        }

	        if (settings.pattern.indexOf('yyyy') < 0) {
	          year = year.toString().substr(2, 2);
	        }

	        if (settings.pattern.indexOf('y') > settings.pattern.indexOf(settings.dateSeparator)) {
	          this.val(month + settings.dateSeparator + year);
	        } else {
	          this.val(year + settings.dateSeparator + month);
	        }

	        this.change();
	      },

	      disableMonths: function(months) {
	        var
	          settings = this.data('monthpicker').settings,
	          container = $('#' + settings.id);

	        settings.disabledMonths = months;

	        container.find('.mtz-monthpicker-month').each(function() {
	          var m = parseInt($(this).data('month'));
	          if ($.inArray(m, months) >= 0) {
	            $(this).addClass('ui-state-disabled');
	          } else {
	            $(this).removeClass('ui-state-disabled');
	          }
	        });
	      },

	      mountWidget: function(settings) {
	        var
	          monthpicker = this,
	          container = $('<div id="' + settings.id + '" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" />'),
	          header = $('<div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all mtz-monthpicker" />'),
	          combo = $('<select class="mtz-monthpicker mtz-monthpicker-year" />'),
	          table = $('<table class="mtz-monthpicker" />'),
	          tbody = $('<tbody class="mtz-monthpicker" />'),
	          tr = $('<tr class="mtz-monthpicker" />'),
	          td = '',
	          selectedYear = settings.selectedYear,
	          option = null,
	          attrSelectedYear = $(this).data('selected-year'),
	          attrStartYear = $(this).data('start-year'),
	          attrFinalYear = $(this).data('final-year');

	        if (attrSelectedYear) {
	          settings.selectedYear = attrSelectedYear;
	        }

	        if (attrStartYear) {
	          settings.startYear = attrStartYear;
	        }

	        if (attrFinalYear) {
	          settings.finalYear = attrFinalYear;
	        }

	        container.css({
	          position: 'absolute',
	          zIndex: 999999,
	          whiteSpace: 'nowrap',
	          width: '250px',
	          overflow: 'hidden',
	          textAlign: 'center',
	          display: 'none',
	          top: monthpicker.offset().top + monthpicker.outerHeight(),
	          left: monthpicker.offset().left
	        });

	        combo.on('change', function() {
	          var months = $(this).parent().parent().find('td[data-month]');
	          months.removeClass('ui-state-active');
	          if ($(this).val() == settings.selectedYear) {
	            months.filter('td[data-month=' + settings.selectedMonth + ']').addClass('ui-state-active');
	          }
	          monthpicker.trigger('monthpicker-change-year', $(this).val());
	        });

	        // mount years combo
	        for (var i = settings.startYear; i <= settings.finalYear; i++) {
	          var option = $('<option class="mtz-monthpicker" />').attr('value', i).append(i);
	          if (settings.selectedYear == i) {
	            option.attr('selected', 'selected');
	          }
	          
	          if(i == '20'+yea[0]){
	        	  option.attr('selected', 'selected');
	          }
	          combo.append(option);
	        }
	        header.append(combo).appendTo(container);

	        // mount months table
	        for (var i = 1; i <= 12; i++) {
	          td = $('<td class="ui-state-default mtz-monthpicker mtz-monthpicker-month" style="padding:5px;cursor:default;" />').attr('data-month', i);
	          if (settings.selectedMonth == i) {
	            td.addClass('ui-state-active');
	          }
	          td.append(settings.monthNames[i - 1]);
	          tr.append(td).appendTo(tbody);
	          if (i % 3 === 0) {
	            tr = $('<tr class="mtz-monthpicker" />');
	          }
	        }

	        tbody.find('.mtz-monthpicker-month').on('click', function() {
	          var m = parseInt($(this).data('month'));
	          if ($.inArray(m, settings.disabledMonths) < 0) {
	            settings.selectedYear = $(this).closest('.ui-datepicker').find('.mtz-monthpicker-year').first().val();
	            settings.selectedMonth = $(this).data('month');
	            settings.selectedMonthName = $(this).text();
	            monthpicker.trigger('monthpicker-click-month', $(this).data('month'));
	            $(this).closest('table').find('.ui-state-active').removeClass('ui-state-active');
	            $(this).addClass('ui-state-active');
	          }
	        });

	        table.append(tbody).appendTo(container);

	        container.appendTo('body');
	      },

	      destroy: function() {
	        return this.each(function() {
	          $(this).removeClass('mtz-monthpicker-widgetcontainer').unbind('focus').removeData('monthpicker');
	        });
	      },

	      getDate: function() {
	        var settings = this.data('monthpicker').settings;
	        if (settings.selectedMonth && settings.selectedYear) {
	          return new Date(settings.selectedYear, settings.selectedMonth - 1);
	        } else {
	          return null;
	        }
	      },

	      parseInputValue: function(settings) {
	        if (this.val()) {
	          if (settings.dateSeparator) {
	            var val = this.val().toString().split(settings.dateSeparator);
	            if (settings.pattern.indexOf('m') === 0) {
	              settings.selectedMonth = val[0];
	              settings.selectedYear = val[1];
	            } else {
	              settings.selectedMonth = val[1];
	              settings.selectedYear = val[0];
	            }
	          }
	        }
	      }

	    };

	    $.fn.monthpicker = function(method) {
	      if (methods[method]) {
	        return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
	      } else if (typeof method === 'object' || !method) {
	        return methods.init.apply(this, arguments);
	      } else {
	        $.error('Method ' + method + ' does not exist on jQuery.mtz.monthpicker');
	      }
	    };

	  })(jQuery);
	  
	  Date.prototype.yyyymmdd = function() {
	    var mm = this.getMonth() + 1; // getMonth() is zero-based
	    var dd = this.getDate();

	    return [this.getFullYear(),
	            (mm>9 ? '' : '0') + mm,
	            (dd>9 ? '' : '0') + dd
	           ].join('-');
	  };
	  var date = new Date();
	  var schDate = date.yyyymmdd();
	  $('#schDate').val(schDate);
	  
	  initDatePickers();
	});
	
	
	google.load("visualization", "1", {
		'packages' : [ "corechart" ]
	});
	google.setOnLoadCallback(drawChart);

	function drawChart() {
		
		var data = google.visualization.arrayToDataTable([ [ '월', '매출액' ],
            [ $("#key1").val(), parseInt($("#value1").val()) ], 
            [ $("#key2").val(), parseInt($("#value2").val()) ], 
            [ $("#key3").val(), parseInt($("#value3").val()) ], 
            [ $("#key4").val(), parseInt($("#value4").val()) ], 
            [ $("#key5").val(), parseInt($("#value5").val()) ], 
            [ $("#key6").val(), parseInt($("#value6").val()) ],
            [ $("#key7").val(), parseInt($("#value7").val()) ], 
            [ $("#key8").val(), parseInt($("#value8").val()) ],
            [ $("#key9").val(), parseInt($("#value9").val()) ],
            [ $("#key10").val(), parseInt($("#value10").val()) ],
            [ $("#key11").val(), parseInt($("#value11").val()) ],
            [ $("#key12").val(), parseInt($("#value12").val()) ],
            [ $("#key13").val(), parseInt($("#value13").val()) ],
            [ $("#key14").val(), parseInt($("#value14").val()) ],
            [ $("#key15").val(), parseInt($("#value15").val()) ],
            [ $("#key16").val(), parseInt($("#value16").val()) ],
            [ $("#key17").val(), parseInt($("#value17").val()) ],
            [ $("#key18").val(), parseInt($("#value18").val()) ],
            [ $("#key19").val(), parseInt($("#value19").val()) ],
            [ $("#key20").val(), parseInt($("#value20").val()) ],
            [ $("#key21").val(), parseInt($("#value21").val()) ],
            [ $("#key22").val(), parseInt($("#value22").val()) ],
            [ $("#key23").val(), parseInt($("#value23").val()) ],
            [ $("#key24").val(), parseInt($("#value24").val()) ],
            [ $("#key25").val(), parseInt($("#value25").val()) ],
            [ $("#key26").val(), parseInt($("#value26").val()) ],
            [ $("#key27").val(), parseInt($("#value27").val()) ],
            [ $("#key28").val(), parseInt($("#value28").val()) ],
            [ $("#key29").val(), parseInt($("#value29").val()) ],
            [ $("#key30").val(), parseInt($("#value30").val()) ],
            [ $("#key31").val(), parseInt($("#value31").val()) ]
            ]);

		var options = {
			title : $("#schMonth").val() + '월별 매출 그래프',
			fontSize : '13',
			fontName : '굴림체',
			hAxis : {
				title : '매출일',
				titleTextStyle : {
					color : 'red',
					fontName : '굴림체'
				}
			},
			vAxis : {
				title : '금액',
				titleTextStyle : {
					color : 'blue',
					fontName : '굴림체'
				}
			}
		};

		var chart = new google.visualization.ColumnChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
		data = null;
		chart = null;

		$("#search").click(function() {
			$("#schMonth").val();
			$("#searchForm").attr({
				"method" : "get",
				"action" : "/admin/graph/monthGraph.do"
			});
			$("#searchForm").submit();
		});
	}


</script>

<meta charset="UTF-8">
<title>월별 매출 통계</title>
</head>
<body>

	<table style="width:98%;" >
		<tr>
			<td>
				<form id="searchForm" name="searchForm">
					<h3>년/월 선택</h3>
					<input type="text" id="schMonth" name="schMonth" value="${month }">
				</form> <input type="button" id="search" value="검색">
			</td>
		</tr>
		<tr>
			<td style="padding-left: 20px;">
				<div id="chart_div" style="width: 98%; height: 400px;"></div>
			</td>
		</tr>
	</table>
	
	<div id="graphData">
	<c:set var="a" value="1"/>
	<c:choose>
		<c:when test="${not empty graph}">
			<c:forEach var="income" items="${graph}" varStatus="status">
				<input type="hidden" value="${income.key}" id="key${a}"/>
				<input type="hidden" value="${income.value}" id="value${a }"/>
				<c:set var="a" value="${a+1 }"/>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td>매출값이 존재하지 않습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>