define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {
    var status = $.ajax({url:"order/normal/statusType",async:false})
    var pay = $.ajax({url:"order/normal/payType",async:false})
    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'order/normal/index',
                    add_url: 'order/normal/add',
                    edit_url: 'order/normal/edit',
                    del_url: 'order/normal/del',
                    multi_url: 'order/normal/multi',
                    table: 'order',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id'), operate: false},
                        {field: 'order_sn', title: __('Order_sn'), operate: false},
                        {field: 'user_id', title: __('User_id'), operate: false, formatter: Controller.api.formatter.user},
                        {field: 'pay_type', title: __('Pay_type'), searchList: $.getJSON('order/normal/paySearch'), formatter: Controller.api.formatter.pay},
                        {field: 'goods_name', title: __('Goods_name'), operate: false},
                        {field: 'amount', title: __('Amount'), operate: false},
                        {field: 'add_time', title: __('Add_time'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'pay_time', title: __('Pay_time'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'status', title: __('Status'), searchList: $.getJSON('order/normal/statusSearch'), formatter: Controller.api.formatter.status},
                        {field: 'operate', title: __('Operate'), table: table, buttons: [
                                {name: 'detail', text: '详情', title: '详情', icon: 'fa fa-list', classname: 'btn btn-xs btn-primary btn-dialog', url: 'order/normal/detail'}
                            ], events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            },
            formatter: {
                status: function (value, row, index) {
                    return status.responseJSON[value];
                },
                pay: function (value, row, index) {
                    return pay.responseJSON[value];
                },
                user: function (value, row, index) {
                    //这里手动构造URL
                    url = "user/index?id=" + value;

                    //方式一,直接返回class带有addtabsit的链接,这可以方便自定义显示内容
                    return '<a href="' + url + '" class="label label-success addtabsit" title="' + __("Search %s", value) + '">' + value + '</a>';

                    //方式二,直接调用Table.api.formatter.addtabs
                    //return Table.api.formatter.addtabs(value, row, index, url);
                }
            }
        }
    };
    return Controller;
});