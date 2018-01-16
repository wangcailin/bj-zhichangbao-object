define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {
    var status = $.ajax({url:"order/normal/statusType",async:false})
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
                        {field: 'user_id', title: __('User_id'), operate: false},
                        {field: 'goods_name', title: __('Goods_name'), operate: false},
                        {field: 'amount', title: __('Amount'), operate: false},
                        {field: 'add_time', title: __('Add_time'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'pay_time', title: __('Pay_time'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'status', title: __('Status'), searchList: $.getJSON('order/normal/statusSearch'), formatter: Controller.api.formatter.status},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
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
                    return status.responseJSON[value]
                }
            }
        }
    };
    return Controller;
});