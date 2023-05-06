// 评论管理
<template>
  <div class="m_student">
    <Spin size="large" fix v-if="spinShow"></Spin>
    <!-- 检索条件  社团id  评论内容  学生姓名-->
    <Row class="condition">
      <ul class="flex">
        <li>
          <span class="title">社团id：</span>
          <Input type="number" style="width:150px" v-model="params.comments.teamId" />
        </li>
        <li class="ml10">
          <span class="title">评论内容：</span>
          <Input type="text" style="width:150px" v-model="params.comments.content" />
        </li>
        <li class="ml10" style="flex:1;">
          <span class="title">学生姓名：</span>
          <Input type="text" style="width:150px" v-model="params.comments.studentName" />
        </li>
        <li>
          <Button type="primary" @click="getComments">搜索</Button>
        </li>
      </ul>
    </Row>
    <!-- 表格 -->
    <Row class="mt20">
      <Table stripe :columns="columns" :data="comments"></Table>
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
import CommentService from "../../assets/js/comment.js";
import ConfirmModal from "./confirmModal";
export default {
  name: "student",
  components: { ConfirmModal },
  data() {
    return {
      params: {
        current: 1,
        size: 10,
        comments: {
          teamId: -1, //社团id
          content: "", //评论内容
          studentName: "" //学生姓名
        }
      },
      comments: [], //评论数据
      spinShow: false, //缓冲
      total: 0, //评论总数

      columns: [
        {
          title: "id",
          key: "id"
        },
        {
          title: "社团id",
          key: "teamId"
        },
        {
          title: "姓名",
          key: "studentName"
        },
        {
          title: "评论内容",
          key: "content"
        },
        {
          title: "获赞数量",
          key: "supportCount"
        },
        {
          title: "回复数量",
          key: "replyCount"
        },
        {
          title: "评论时间",
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
                  CommentService.deleteComment(params.row.id).then(res => {
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
      this.getComments();
    },
    // 获取评论信息
    getComments() {
      let vm = this;
      if (!vm.params.comments.teamId >= 0) {
        vm.params.comments.teamId = -1;
      }
      vm.spinShow = true;
      CommentService.getComments(vm.params).then(res => {
        if (res.code == 0) {
          vm.comments = res.data.records;
          vm.total = res.data.total;
        } else {
          vm.$Message.error(res.msg);
        }
        vm.spinShow = false;
      });
    }
  },
  created() {
    this.getComments();
  }
};
</script>
<style lang="scss">
// 检索条件
.m_student .condition li span.title {
  width: 80px;
}
</style>