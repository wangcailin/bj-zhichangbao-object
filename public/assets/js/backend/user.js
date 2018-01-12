define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user/index',
                    add_url: 'user/add',
                    edit_url: 'user/edit',
                    del_url: 'user/del',
                    multi_url: 'user/multi',
                    table: 'user',
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
                        {field: 'username', title: __('Username'), operate: false},
                        {field: 'nickname', title: __('Nickname'), operate: false},
                        {field: 'avatar', title: __('Avatar'), formatter: Table.api.formatter.image, operate: false},
                        {field: 'mobile', title: __('Mobile'), operate: false},
                        {field: 'vip', title: __('Vip'), searchList: $.getJSON('user/getVipListAjax'), formatter: Controller.api.formatter.vip},
                        {field: 'vip_time', title: __('Vip_time'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'create_time', title: __('Create_time'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'status', title: __('Status'), searchList: $.getJSON('user/getStatusListAjax'), formatter: Controller.api.formatter.status},
                        {field: 'operate', title: __('Operate'), table: table, buttons: [
                            {name: 'detail', text: '详情', title: '详情', icon: 'fa fa-list', classname: 'btn btn-xs btn-primary btn-dialog', url: 'user/detail'}
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
                vip: function (value, row, index) {
                    if (value == '1'){
                        return '<span class="label label-info">普通会员</span>';
                    }else if (value == '2'){
                        return '<span class="label lable-maroon">VIP</span>';
                    }else if (value == '3'){
                        return '<span class="label label-danger">SVIP</span>';
                    }else {
                        return '<span class="label label-primary">注册会员</span>';
                    }
                },
                status: function (value, row, index) {
                    if (value == '1'){
                        return '<span class="text-success"><i class="fa fa-circle"></i> 启用</span>';
                    }else if (value == '0'){
                        return '<span class="text-grey"><i class="fa fa-circle"></i> 禁用</span>';
                    }
                }
            }
        }
    };
    return Controller;
});