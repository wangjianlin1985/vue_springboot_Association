// 用户管理
<template>
  <div class="m_student">
    <Spin size="large" fix v-if="spinShow"></Spin>
    <!-- 检索条件  学号 管理员  姓名-->
    <Row class="condition">
      <ul class="flex">
        <li>
          <span class="title">学号：</span>
          <Input type="text" style="width:150px" v-model="params.student.sno" />
        </li>
        <li class="ml10">
          <span class="title">身份：</span>
          <Select v-model="params.student.isManager" style="width:150px">
            <Option
              v-for="item in isManagerList"
              :value="item.value"
              :key="item.value"
            >{{ item.label }}</Option>
          </Select>
        </li>
        <li class="ml10" style="flex:1;">
          <span class="title">姓名：</span>
          <Input type="text" style="width:150px" v-model="params.student.username" />
        </li>
        <li>
          <Button type="primary" @click="getAllStudent">搜索</Button>
        </li>
      </ul>
    </Row>
    <!-- 表格 -->
    <Row class="mt20">
      <Table stripe :columns="columns" :data="students"></Table>
    </Row>
    <!-- 分页 -->
    <div class="mdt20">
      <Page
        :total="total"
        :current="params.current"
        :page-size="params.size"
        class="page"
        @on-change="pageChange"
      />
    </div>
  </div>
</template>
<script>
import StudentService from "../../assets/js/student.js";
import ConfirmModal from "./confirmModal";
export default {
  name: "student",
  components: { ConfirmModal },
  data() {
    return {
      params: {
        current: 1,
        size: 10,
        student: {
          sno: "",
          isManager: -1,
          username: ""
        }
      },
      students: [], //学生数据
      spinShow: false, //缓冲
      total: 0, //学生总数
      isManagerList: [
        {
          value: -1,
          label: "所有用户"
        },
        {
          value: 0,
          label: "普通用户"
        },
        {
          value: 1,
          label: "社团管理员"
        },
        {
          value: 2,
          label: "超级管理员"
        }
      ],
      columns: [
        {
          title: "id",
          key: "id"
        },
        {
          title: "学号",
          key: "sno"
        },
        // {
        //   title: "密码",
        //   key: "password"
        // },
        {
          title: "姓名",
          key: "username"
        },
        {
          title: "性别",
          render: (h, params) => {
            return h("div", params.row.sex ? "女" : "男");
          }
        },
        {
          title: "身份",
          render: (h, params) => {
            let str = "";
            switch (params.row.isManager) {
              case 0:
                str = "普通成员";
                break;
              case 1:
                str = "社团管理员";
                break;
              case 2:
                str = "超级管理员";
                break;
            }
            return h("div", str);
          }
        },
        {
          title: "手机号",
          key: "phone"
        },
        {
          title: "邮箱",
          key: "email"
        },
        {
          title: "个人简介",
          key: "introduce"
        },
        {
          title: "注册时间",
          key: "createTime"
        },
        {
          title: "操作",
          render: (h, params) => {
            let vm = this;
            let delBtn = h(ConfirmModal, {
              props: {
                sureMsg: "您确认要删除该条数据吗？",
                btnType: "1"
              },
              on: {
                func() {
                  if (params.row.isManager == 2) {
                    vm.$Message.error("无法删除超级管理员！");
                    return;
                  }
                  StudentService.deleteStudent(params.row.id).then(res => {
                    if (res.code == 0) {
                      vm.$Message.success("操作成功！");
                      location.reload();
                    } else {
                      vm.$Message.error(res.msg);
                    }
                  });
                }
              }
            });

            let btns = [];
            btns.push(delBtn);
            return h("div", btns);
          }
        }
      ]
    };
  },
  methods: {
    /*页码改变*/
    pageChange(page) {
      this.params.current = page;
      this.getAllStudent();
    },
    // 获取学生信息
    getAllStudent() {
      let vm = this;
      vm.spinShow = true;
      StudentService.getAllStudent(vm.params).then(res => {
        if (res.code == 0) {
          vm.students = res.data.records;
          vm.total = res.data.total;
        } else {
          vm.$Message.error(res.msg);
        }
      });
      vm.spinShow = false;
    }
  },
  created() {
    this.getAllStudent();
  }
};
</script>
<style lang="scss">
// 检索条件
.m_student .condition li span.title {
  width: 80px;
}
</style>