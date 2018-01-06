define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {
    var statusType = [];
    statusType = $.getJSON('evidence/normal/getStatusList');

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'evidence/normal/index',
                    add_url: 'evidence/normal/add',
                    edit_url: 'evidence/normal/edit',
                    del_url: 'evidence/normal/del',
                    multi_url: 'evidence/normal/multi',
                    table: 'evidence',
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
                        {field: 'evidence_sn', title: __('Evidence_sn'), operate: false},
                        {field: 'user_id', title: __('User_id'), operate: false},
                        {field: 'email', title: __('Email'), operate: false},
                        {field: 'evidence_time', title: __('Evidence_time'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'status', title: __('Status'), searchList: statusType, formatter: Controller.api.formatter.status},
                        {field: 'operate', title: __('Operate'), table: table, buttons: [
                            {name: 'detail', text: '详情', title: '详情', icon: 'fa fa-list', classname: 'btn btn-xs btn-primary btn-dialog', url: 'evidence/normal/detail'},
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
                },
            }
        }
    };
    return Controller;
});