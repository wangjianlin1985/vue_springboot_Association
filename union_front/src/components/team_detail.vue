// 社团详情
<template>
  <div class="team_detial">
    <img src="../assets/img/teams.jpg" alt="社团展示" style="width:100%;height:300px;" />
    <Spin size="large" fix v-if="spinShow"></Spin>
    <div class="main">
      <Row type="flex" justify="space-between" class="code-row-bg row1">
        <Col span="18">
          <!-- 导航 -->
          <div class="nav flex align_items_centeer">
            <a href="/index" style="padding-top:5px;">
              <img src="../assets/img/home.png" alt="home" class="home_img" />
            </a>
            <span style="padding-left:10px;">>></span>
            <a href="teams">社团世界</a>
            <span style="padding-left:10px;">>></span>
            <p style="color:#515a6e;margin-left:10px;">{{team.teamname}}</p>
          </div>

          <!-- 社团名片 -->
          <Card class="detail">
            <div class="up_bg">
              <img :src="team.themeImg||'/static/default_team_img.png'" alt="社团主题图" />
              <p class="teamname">{{team.teamname}}</p>
              <Button
                type="primary"
                class="in_team_btn"
                @click="showModal"
                :disabled="disabled"
                v-if="!is_in_team"
              >加入社团</Button>
              <Button type="warning" class="in_team_btn" v-if="is_in_team">退出社团</Button>
            </div>
            <div class="down_bg">
              <p>
                <img src="../assets/img/calender_logo.png" alt="创建时间_logo" />
                创建时间:{{team.createTime}}
                <span
                  style="display:inline-block;width:20px;"
                ></span>
                <img src="../assets/img/person_logo.png" alt="成员_logo" />
                当前成员:{{team.persons}}人
              </p>
            </div>
          </Card>
          <!-- 社团详情 -->
          <Card class="content">
            <ul>
              <li>
                <strong>社团名称</strong>
                :{{team.teamname}}
              </li>
              <li>
                <strong>社长大大</strong>
                :
                <img
                  :src="'/static/avatar_'+manager.avatar+'.png'"
                  alt="头像"
                  class="manager_avatar"
                />
                {{manager.username}}
              </li>
              <li>
                <strong>现有人数</strong>
                :{{team.persons}}
              </li>
              <li>
                <strong>创建时间</strong>
                :{{team.createTime}}
              </li>
              <li>
                <strong>社团等级</strong>
                :
                <Rate v-model="team.level" disabled />
              </li>
              <li>
                <strong>社团类别</strong>
                :
                <span v-if="team.type==1">思想理论类</span>
                <span v-else-if="team.type==2">文艺体育类</span>
                <span v-else-if="team.type==3">就业创业类</span>
                <span v-else-if="team.type==4">公益服务类</span>
                <span v-else-if="team.type==5">学术科研类</span>
                <span v-else>网络信息类</span>
              </li>
              <li>
                <strong>社团宗旨</strong>
                :
                <span v-if="!isOperating">{{team.theme}}</span>
                <Input v-else v-model="team.theme" type="text" style="width:500px" />
              </li>
              <li>
                <strong>社团介绍</strong>
                :
                <span v-if="!isOperating">{{team.description}}</span>
                <Input
                  v-else
                  v-model="team.description"
                  type="textarea"
                  :rows="6"
                  :autosize="{minRows: 6,maxRows: 6}"
                />
              </li>
              <li>
                <strong>联系方式</strong>
                :
                <span v-if="!isOperating">{{team.contact||"无"}}</span>
                <Input v-else v-model="team.contact" type="text" style="width:500px" />
              </li>
              <li v-if="isOperating">
                <strong>主题图</strong>
                :
                <Input v-model="team.themeImg" type="text" style="width:500px;" />
              </li>
            </ul>
          </Card>

          <Collapse class="mt20" @on-change="loadComments">
            <Panel>
              评论区
              <span style="float:right;margin-right:2%;" @click="showAddComment=true">
                <Icon type="md-text" />
                {{commentsTotal>0?commentsTotal:'*'}}
              </span>
              <div slot="content" style="width:86%;margin:10px auto;" class="comment_div">
                <ul>
                  <li v-for="(item,index) in comments" :key="index" style="margin-bottom:20px;">
                    <Row type="flex" justify="space-between" class="code-row-bg row1">
                      <Col span="2">
                        <img
                          :src="'/static/avatar_'+item.avatar+'.png'"
                          alt="头像"
                          class="comment_avatar"
                        />
                      </Col>
                      <Col span="22">
                        <p class="comment_name">
                          {{item.studentName}}
                          <Icon type="md-flower" v-if="item.isManager>0" title="管理员标志" />
                          <span style="float:right;" @click="addSupport(index,item.id)">
                            <Icon type="md-thumbs-up" class="support" />
                            {{item.supportCount}}
                          </span>
                        </p>
                        <p>{{item.content}}</p>
                        <p class="flex justify_content_between">
                          <span style="color:#ccc;">{{item.createTime}}</span>
                          <span>
                            <span
                              v-if="!item.showApply&&item.replyCount>0"
                              style="color:#ccc;cursor:pointer;margin-right:10px;"
                              @click="getReply(index,item.id)"
                            >
                              展开回复
                              <Icon type="ios-arrow-down" />
                            </span>
                            <span
                              v-if="item.showApply"
                              style="color:#ccc;cursor:pointer;margin-right:10px;"
                              @click="foldReply(index)"
                            >
                              收起回复
                              <Icon type="ios-arrow-up" />
                            </span>
                            <Icon
                              type="md-text"
                              @click="showAddReplyModal(item.id)"
                              style="cursor:pointer;"
                            />
                            {{item.replyCount}}
                          </span>
                        </p>
                        <!-- 如果回复这是回复区 -->
                        <div class="reply_div" v-if="item.showApply">
                          <ul>
                            <li
                              v-for="(rep,ind) in item.applys"
                              :key="ind"
                              style="margin-top:20px;"
                            >
                              <Row type="flex" justify="space-between" class="code-row-bg row1">
                                <Col span="2">
                                  <img
                                    :src="'/static/avatar_'+rep.avatar+'.png'"
                                    alt="头像"
                                    class="comment_avatar"
                                  />
                                </Col>
                                <Col span="22">
                                  <p class="comment_name">
                                    {{rep.studentName}}
                                    <Icon type="md-flower" v-if="rep.isManager>0" title="管理员标志" />
                                    <span
                                      style="float:right;"
                                      @click="addReplySupport(index,ind,rep.id)"
                                    >
                                      <Icon type="md-thumbs-up" class="support" />
                                      {{rep.supportCount}}
                                    </span>
                                  </p>
                                  <p>{{rep.content}}</p>
                                  <p style="color:#ccc;">{{rep.createTime}}</p>
                                </Col>
                              </Row>
                            </li>
                          </ul>
                        </div>
                      </Col>
                    </Row>
                  </li>
                </ul>
                <div style="margin:20px auto;text-align:center;">
                  <Page
                    :total="commentsTotal"
                    :current="comment_params.current"
                    :page-size="comment_params.size"
                    class="page"
                    @on-change="pageChange"
                  />
                </div>
              </div>
            </Panel>
          </Collapse>
        </Col>

        <!-- 社团活动 -->
        <Col span="5" class="team_activity">
          <Card class="mt20">
            <!-- 社团活动 -->
            <div class="flex align_items_centeer">
              <div class="blue_column"></div>
              <span class="title">该社团最新活动</span>
            </div>
            <div>
              <ul>
                <li v-for="item in activityList" :key="item.id" style="margin:15px 0 0 15px;">
                  <router-link :to="{path:'activity_detail',query:{activityId:item.id}}">
                    <p>活动名称:{{item.activityName}}</p>
                    <p>活动地点:{{item.address}}</p>
                    <p>活动时间:{{item.createTime}}</p>
                    <p>活动简介:{{item.summary}}</p>
                  </router-link>
                </li>
              </ul>
            </div>
            <!-- 操作 -->
            <div v-if="is_team_manager">
              <div class="flex align_items_centeer mt20">
                <div class="blue_column"></div>
                <span class="title">操作</span>
              </div>
              <Button
                v-if="!isOperating"
                type="primary"
                style="margin:15px 0 0 15px;"
                @click="isOperating=true"
              >编辑社团</Button>
              <Button
                v-else
                type="success"
                style="margin:15px 0 0 15px;"
                @click="showSaveModal=true"
              >保存编辑</Button>
              <Button
                type="primary"
                style="margin:15px 0 0 15px;"
                @click="showNeweAcModal=true"
              >新增活动</Button>
            </div>
          </Card>
        </Col>
      </Row>
    </div>
    <!-- 加入社团申请表 -->
    <Modal v-model="showApplyModal" title="入团申请表" @on-ok="applyTeam" @on-cancel="cancelApply">
      <p>为什么想要加入我们？</p>
      <Input
        v-model="params.reason"
        type="textarea"
        :autosize="{minRows: 3,maxRows: 5}"
        placeholder="请输入你的理由..."
      />
      <p class="mt20">你的联系方式(请备注手机还是QQ或是微信)：</p>
      <Input
        v-model="params.contactWay"
        type="textarea"
        :autosize="{minRows: 3,maxRows: 3}"
        placeholder="给个联系方式呗..."
      />
    </Modal>

    <!-- 保存编辑提示框 -->
    <Modal
      v-model="showSaveModal"
      title="操作提醒"
      @on-ok="updateThisTeam"
      @on-cancel="showSaveModal=false"
    >
      <h3>您确定要保存当前编辑吗？</h3>
    </Modal>

    <!-- 新活动信息填写 -->
    <Modal
      v-model="showNeweAcModal"
      title="编辑活动信息"
      @on-ok="addNewAc"
      @on-cancel="showNeweAcModal=false"
      width="600"
    >
      <div class="newAc" style="width:86%;margin:10px auto;">
        <ul>
          <li>
            <span class="ac_title">活动名称:</span>
            <Input type="text" v-model="newAc.activityName" style="width:200px" />
          </li>
          <li>
            <span class="ac_title">活动时间:</span>
            <DatePicker
              type="datetime"
              :value="newAc.createTime"
              placeholder="Select date and time"
              style="width: 200px"
            ></DatePicker>
          </li>
          <li>
            <span class="ac_title">活动地点:</span>
            <Input type="text" v-model="newAc.address" style="width:200px" />
          </li>
          <li>
            <span class="ac_title">活动经费:</span>
            <Input type="text" v-model="newAc.money" style="width:200px" />
          </li>
          <li>
            <span class="ac_title">活动简介:</span>
            <Input
              type="textarea"
              v-model="newAc.summary"
              :rows="2"
              :autosize="{minRows: 2,maxRows: 2}"
            />
          </li>
          <li>
            <span class="ac_title">活动详情:</span>
            <Input
              type="textarea"
              v-model="newAc.description"
              :rows="5"
              :autosize="{minRows: 5,maxRows: 5}"
            />
          </li>
          <li>
            <span class="ac_title">活动图片:</span>
            <Input type="text" v-model="newAc.photos" placeholder="请输入图片网络地址" />
          </li>
        </ul>
      </div>
    </Modal>

    <!-- 评论信息填写 -->
    <Modal
      v-model="showAddComment"
      title="发表评论"
      @on-ok="addNewComment"
      @on-cancel="showAddComment=false"
      width="400"
    >
      <div class="newAc" style="width:86%;margin:10px auto;">
        <Input
          type="textarea"
          maxlength="300"
          show-word-limit
          v-model="add_commment_params.content"
        />
      </div>
    </Modal>

    <!-- 回复信息填写 -->
    <Modal
      v-model="showAddReply"
      title="发表回复"
      @on-ok="addReply"
      @on-cancel="showAddReply=false"
      width="400"
    >
      <div class="newAc" style="width:86%;margin:10px auto;">
        <Input type="textarea" maxlength="300" show-word-limit v-model="add_reply_params.content" />
      </div>
    </Modal>
  </div>
</template>

<script>
import TeamService from "../assets/js/team";
import StudentServicee from "../assets/js/student";
import ActivityService from "../assets/js/activity";
import CommentService from "../assets/js/comment";
export default {
  name: "teamDetail",
  data() {
    return {
      id: 0, //当前社团的id
      team: {}, //当前社团
      spinShow: false,
      manager: {}, //管理员
      disabled: false, //是否禁止点击加入社团
      showApplyModal: false, //申请入社表
      params: {
        applyToId: 0, //社团id
        reason: "", //申请理由
        contactWay: "" //联系方式
      },
      act_params: {
        current: 1,
        size: 3,
        teamId: -1
      }, //获取社团活动的参数
      activityList: [], //活动列表
      is_in_team: false, //当前用户是否已经是该社团的成员
      isOperating: false, //是否在进行操作
      is_team_manager: false, //当前用户是否是该社团的社长
      showSaveModal: false, //保存编辑提示框

      showNeweAcModal: false, //活动信息填写
      newAc: {
        teamId: 0,
        teamname: "",
        activityName: "",
        createTime: "",
        address: "",
        money: 0,
        summary: "",
        description: "",
        photos: ""
      }, //新活动参数

      //关于评论的参数
      showAddComment: false, //新增评论提示框
      isLoadingComments: false, //是否加载评论
      comment_params: {
        current: 1,
        size: 10,
        comments: {
          teamId: -1
        }
      }, //获取评论的参数
      add_commment_params: {
        teamId: -1,
        content: ""
      }, //新增评论的参数
      comments: [], //得到的评论
      commentsTotal: 0, //评论总数
      showAddReply: false, //回复对话框
      reply_params: {
        current: 1,
        size: 3,
        reply: {
          toWhich: -1
        }
      }, //获取回复的参数
      add_reply_params: {
        toWhich: -1,
        content: ""
      } //新增回复的参数
    };
  },
  methods: {
    // 获取社团信息
    getTeam() {
      let vm = this;
      vm.spinShow = true;
      TeamService.getTeamById(vm.id).then(res => {
        if (res.code == 0) {
          vm.team = res.data;
          StudentServicee.getStudentById(vm.team.teamManagerId).then(resp => {
            if (resp.code == 0) {
              vm.manager = resp.data;
              vm.isInThisTeam(); //判断用户是否在社团中
            } else {
              vm.$Message.error(resp.msg);
            }
          });
        } else {
          vm.$Message.error(res.msg);
        }
        vm.spinShow = false;
      });
    },
    //显示申请表
    showModal() {
      let vm = this;
      vm.showApplyModal = true; //显示表单
    },
    //取消申请
    cancelApply() {
      let vm = this;
      vm.showApplyModal = false; //隐藏申请表
    },
    // 申请加入社团
    applyTeam() {
      let vm = this;

      // 验证输入
      if (vm.params.reason == "") {
        this.$Message.error("理由一栏不可以为空哦~");
        return;
      }
      if (vm.params.contactWay == "") {
        this.$Message.error("小主可否留个联系方式~");
        return;
      }

      vm.spinShow = true;
      vm.params.applyToId = vm.team.id;
      TeamService.createApply(vm.params).then(res => {
        if (res.code == 0) {
          vm.$Message.success("您的申请已成功提交，请小主静候佳音~");
          vm.showApplyModal = false;
          vm.disabled = true;
          setTimeout(function() {
            vm.disabled = false;
          }, 1000 * 3);
        } else {
          vm.$Message.error(res.msg);
        }
      });
      vm.spinShow = false;
    },
    //判断用户是否在该社团中
    isInThisTeam() {
      let vm = this;
      let teamMember = {
        studentId: 0,
        teamId: vm.team.id
      };
      TeamService.isInThisTeam(teamMember).then(res => {
        if (res.code == 0) {
          vm.is_in_team = res.data;
        } else {
          console.log(res.msg);
        }
      });
    },
    //判断用户是否是该社团的社长
    isTeamManager() {
      let vm = this;
      TeamService.isTeamManager(vm.id).then(res => {
        if (res.code == 0) {
          vm.is_team_manager = res.data;
        } else {
          console.log(res.msg);
        }
      });
    },
    // 获取社团的活动信息
    getTeamActivitys() {
      let vm = this;
      vm.spinShow = true;
      vm.act_params.teamId = vm.id;
      ActivityService.getActivity(vm.act_params).then(res => {
        if (res.code == 0) {
          vm.activityList = res.data.records;
        } else {
          vm.$Message.error(res.msg);
        }
        vm.spinShow = false;
      });
    },
    // 编辑社团
    updateThisTeam() {
      let vm = this;
      vm.spinShow = true;
      TeamService.updateTeamInfo(vm.team).then(res => {
        if (res.code == 0) {
          if (res.data) {
            vm.$Message.success("保存成功！");
          } else {
            vm.$Message.error("保存失败！");
          }
        } else {
          vm.$Message.error(res.msg);
        }
        vm.isOperating = false;
        vm.spinShow = false;
      });
    },
    // 新增一条活动信息
    addNewAc() {
      let vm = this;
      vm.newAc.teamId = vm.team.id;
      vm.newAc.teamname = vm.team.teamname;
      ActivityService.addNewActivity(vm.newAc).then(res => {
        if (res.code == 0) {
          if (res.data) {
            vm.$Message.success("新增成功，可前往活动页面查看!");
          } else {
            vm.$Message.error("新增失败！");
          }
        } else {
          vm.$Message.error(res.msg);
        }
      });
    },
    // 显示评论区
    loadComments() {
      let vm = this;
      if (!vm.isLoadingComments) {
        vm.getComments();
      }
      vm.isLoadingComments = true;
    },
    // 获取关于这个社团的评论
    getComments() {
      let vm = this;
      vm.spinShow = true;
      vm.comment_params.comments.teamId = vm.id;
      CommentService.getComments(vm.comment_params).then(res => {
        if (res.code == 0) {
          vm.comments = res.data.records;
          vm.commentsTotal = res.data.total;
          for (let i = 0; i < vm.comments.length; i++) {
            vm.comments[i].applys = [];
            vm.comments[i].hasGetApply = false;
            vm.comments[i].showApply = false;
            vm.comments[i].isSupported = false; //是否已经点赞
          }
        } else {
          vm.$Message.error(res.msg);
        }
        vm.spinShow = false;
      });
    },
    // 获取回复
    getReply(index, commentId) {
      let vm = this;
      if (!vm.comments[index].hasGetApply) {
        vm.reply_params.reply.toWhich = commentId;
        CommentService.getReplys(vm.reply_params).then(resp => {
          vm.comments[index].applys = resp.data.records;
          vm.comments[index].hasGetApply = true;
          vm.comments[index].showApply = true;
          for (let i = 0; i < vm.comments[index].applys.length; i++) {
            vm.comments[index].applys[i].isSupported = false; //是否已经点赞
          }
          vm.$forceUpdate();
        });
      } else {
        vm.comments[index].showApply = true;
        vm.$forceUpdate();
      }
    },
    // 收起回复
    foldReply(index) {
      this.comments[index].showApply = false;
      this.$forceUpdate();
    },
    // 给评论增加一个赞
    addSupport(index, id) {
      let vm = this;
      if (vm.comments[index].isSupported) {
        vm.$Message.warning("您已经点赞该评论");
        return;
      }
      CommentService.addCommentSupport(id).then(res => {
        if (res.code == 0 && res.data) {
          vm.$Message.success("点赞成功");
          vm.comments[index].supportCount++;
          vm.comments[index].isSupported = true;
          vm.$forceUpdate();
        } else {
          vm.$Message.error("点赞失败");
        }
      });
    },
    // 增加一条回复
    addReply() {
      let vm = this;
      vm.spinShow = true;
      CommentService.addNewReply(vm.add_reply_params).then(res => {
        if (res.code == 0 && res.data) {
          vm.$Message.success("新增成功!");
        } else {
          vm.$Message.error("新增失败!");
        }
        vm.spinShow = false;
        location.reload();
      });
    },
    // 给回复增加一个赞
    addReplySupport(index, ind, id) {
      let vm = this;
      if (vm.comments[index].applys[ind].isSupported) {
        vm.$Message.warning("您已经点赞该回复");
        return;
      }
      CommentService.addReplySupport(id).then(res => {
        if (res.code == 0 && res.data) {
          vm.$Message.success("点赞成功");
          vm.comments[index].applys[ind].supportCount++;
          vm.comments[index].applys[ind].isSupported = true;
          vm.$forceUpdate();
        } else {
          vm.$Message.error("点赞失败");
        }
      });
    },
    // 翻页
    pageChange(page) {
      this.comment_params.current = page;
      this.getComments();
    },
    // 新增一条评论
    addNewComment() {
      let vm = this;
      vm.spinShow = true;
      vm.add_commment_params.teamId = vm.id;
      CommentService.addNewComment(vm.add_commment_params).then(res => {
        if (res.code == 0 && res.data) {
          vm.$Message.success("新增成功!");
        } else {
          vm.$Message.error("新增失败!");
        }
        vm.spinShow = false;
        location.reload();
      });
    },
    // 打开新增回复的对话框
    showAddReplyModal(id) {
      this.showAddReply = true;
      this.add_reply_params.toWhich = id;
    }
  },
  created() {
    this.id = this.$route.query.itemId; //接收传入的id
    this.getTeam();
    this.getTeamActivitys();
    this.isTeamManager();
  }
};
</script>

<style lang="scss">
.team_detial .nav {
  margin-top: 20px;
  border: 1px solid #dcdee2;
  border-color: #e8eaec;
  background: #fff;
  border-radius: 4px;
  font-size: 14px;
  position: relative;
  transition: all 0.2s ease-in-out;
  color: $base_color;
}
.team_detial .nav a {
  color: $base_color;
  margin-left: 10px;
}
.team_detial .nav .home_img {
  height: 20px;
}
// 社团名片
.team_detial .detail {
  margin-top: 15px;
}
.team_detial .detail .up_bg {
  background-color: $base_color;
  height: 100px;
  border-radius: 5px 5px 0 0;
  position: relative;
}
// 社团主题图
.team_detial .detail .up_bg img {
  height: 140px;
  width: 140px;
  border-radius: 50%;
  border: 5px solid #fff;
  position: absolute;
  left: 50px;
  top: 30px;
}
.team_detial .detail .up_bg img:hover {
  transform: scale(1.2);
}
.team_detial .detail .up_bg .teamname {
  color: #fff;
  margin-left: 220px;
  font-size: 20px;
  font-weight: bold;
  padding-top: 60px;
}
.team_detial .detail .down_bg {
  background-color: $base_bg;
  height: 100px;
  border-radius: 0 0 5px 5px;
}
.team_detial .detail .down_bg img {
  vertical-align: sub;
}
.team_detial .detail .down_bg p {
  margin-left: 220px;
  padding-top: 15px;
  color: $base_color;
}
// 社团详情介绍
.team_detial .content {
  margin-top: 15px;
}
.team_detial .content li {
  margin-top: 10px;
  line-height: 30px;
}
.team_detial .content li .manager_avatar {
  height: 50px;
  width: 50px;
  border-radius: 50%;
  border: 3px solid $base_color;
}
// 加入社团按钮
.team_detial .in_team_btn {
  margin-top: -32px;
  float: right;
  margin-right: 20px;
}
// 右侧标题
.team_activity .title {
  margin-left: 10px;
  font-size: 18px;
}

// 活动填写
.newAc li {
  line-height: 40px;
}
.newAc span.ac_title {
  display: inline-block;
  width: 100px;
}
// 评论区 头像
.team_detial .comment_div .comment_avatar {
  height: 50px;
  width: 50px;
  border-radius: 50%;
  border: 1px solid #ccc;
}
.team_detial .comment_div .comment_name {
  color: orange;
  font-size: 18px;
}
// 赞
.team_detial .comment_div .support {
  vertical-align: text-top;
  cursor: pointer;
}
.team_detial .comment_div .support:hover {
  transform: scale(1.2);
}
</style>