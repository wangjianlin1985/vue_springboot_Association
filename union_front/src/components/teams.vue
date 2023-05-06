// 社团页
<template>
  <div class="teams">
    <!-- 图片 -->
    <img src="../assets/img/teams.jpg" alt="社团展示" style="width:100%;height:300px;" />
    <!-- 主体 -->
    <div class="main">
      <Row type="flex" justify="space-between" class="code-row-bg row1">
        <Col span="18">
          <!-- 社团九宫格 -->
          <div>
            <div class="flex flex_wrap_wrap justify_content_between">
              <Card class="team_card" v-for="item in teamList" :key="item.id">
                <router-link :to="{path:'team_detail',query:{itemId:item.id}}">
                  <div>
                    <img :src="item.themeImg||'/static/default_team_img.png'" alt="社团图片" />
                  </div>
                  <p class="title">{{item.teamname}}</p>
                  <p class="summary">
                    <strong>社团理念：</strong>
                    {{item.theme.substr(0,[34])}}
                    <span
                      v-if="item.theme.length>34"
                    >...</span>
                  </p>
                </router-link>
              </Card>
            </div>
            <div style="margin: 20px auto; text-align:center;">
              <Page
                :total="total"
                :current="params.pageCurrent"
                :page-size="params.pageSize"
                class="page"
                @on-change="pageChange"
              />
            </div>
          </div>
        </Col>
        <Col span="5">
          <Card class="mt20">
            <div class="team_right">
              <!-- 社团搜索 -->
              <div class="flex align_items_centeer">
                <div class="blue_column"></div>
                <span class="title">搜索社团</span>
              </div>
              <Input
                type="text"
                v-model="params.teamname"
                search
                enter-button
                class="input"
                @on-search="getTeams"
              />

              <!-- 社团分类 -->
              <div class="flex align_items_centeer mt20">
                <div class="blue_column"></div>
                <span class="title">社团分类</span>
              </div>
              <div class="mt20">
                <CheckboxGroup v-model="types" class="ml10" @on-change="getTeamsByType">
                  <Checkbox label="1" border>思想理论类</Checkbox>
                  <Checkbox label="2" border>文艺体育类</Checkbox>
                  <Checkbox label="3" border>就业创业类</Checkbox>
                  <Checkbox label="4" border>公益服务类</Checkbox>
                  <Checkbox label="5" border>学术科研类</Checkbox>
                  <Checkbox label="6" border>网络信息类</Checkbox>
                </CheckboxGroup>
              </div>

              <!-- 关于我们 -->
              <div class="flex align_items_centeer mt20">
                <div class="blue_column"></div>
                <span class="title">关于我们</span>
              </div>
              <div class="mt20 ml10" style="text-indent:2em;width:90%;">
                社团联盟系统旨在为高校提供社团管理的平台，为学
                生、社团管理者、学校管理者提供多方面服务，规范、高效地
                管理高校社团。学生可通过系统了解社团、查询社团、加入社团，
                并可以获取社团通知，及时了解社团活动。社团管理者可以进行成员管理、通
                知发布等。系统管理员可以进行社团管理。
              </div>

              <!-- 创建社团 -->
              <div class="flex align_items_centeer mt20">
                <div class="blue_column"></div>
                <span class="title">创建社团</span>
              </div>
              <div class="mt20 flex">
                <Button type="primary" class="ml10" @click="showCreateTeamModal=true">创建社团</Button>
              </div>
            </div>
          </Card>
        </Col>
      </Row>
    </div>

    <Modal
      title="创建社团申请表"
      v-model="showCreateTeamModal"
      @on-ok="createNewTeam"
      @on-cancel="showCreateTeamModal=false"
    >
      <ul class="create_team">
        <li class="create_item">
          <span class="create_title">社团名称:</span>
          <Input
            type="text"
            style="width:300px;"
            v-model="create_team_params.applyToName"
            maxlength="16"
          />
        </li>
        <li class="create_item">
          <span class="create_title">社团类别:</span>
          <Select v-model="create_team_params.teamType" style="width:300px;">
            <Option v-for="item in teamTypes" :value="item.value" :key="item.value">{{ item.label }}</Option>
          </Select>
        </li>
        <li class="create_item">
          <span class="create_title">创建理由:</span>
          <Input
            type="textarea"
            v-model="create_team_params.reason"
            :rows="4"
            :autosize="{maxRows:4,minRows: 4}"
            style="width:300px;"
          />
        </li>
        <li class="create_item">
          <span class="create_title">联系方式:</span>
          <Input
            type="text"
            style="width:300px;"
            v-model="create_team_params.contactWay"
            maxlength="16"
          />
        </li>
      </ul>
    </Modal>
  </div>
</template>

<script>
import TeamService from "../assets/js/team";
export default {
  name: "teams",
  data() {
    return {
      teamList: [], //社团列表
      total: 0, //社团总数
      params: {
        pageCurrent: 1, //每页显示的数量
        pageSize: 9, //社团总数
        teamname: "" //搜索框中输入的社团名称
      },
      types: ["1", "2", "3", "4", "5", "6"], //社团类型
      showCreateTeamModal: false, //创建社团申请表
      create_team_params: {
        applyFromId: 0, //申请人id，后台获取
        applyToName: "", //需要创建的社团名称
        teamType: 1, //社团类别
        reason: "", //创建理由
        contactWay: "" //联系方式
      },
      teamTypes: [
        { value: 1, label: "思想理论类" },
        { value: 2, label: "文艺体育类" },
        { value: 3, label: "就业创业类" },
        { value: 4, label: "公益服务类" },
        { value: 5, label: "学术科研类" },
        { value: 6, label: "网络信息类" }
      ]
    };
  },
  methods: {
    /*页码改变*/
    pageChange(page) {
      this.params.pageCurrent = page;
      this.getTeams();
    },
    /*获取列表项*/
    getTeams() {
      TeamService.getAllTeam(this.params).then(res => {
        if (res.code == 0) {
          this.teamList = res.data.records; //社团列表
          this.total = res.data.total; //社团总数
        } else {
          this.$Message.error(res.data);
        }
      });
    },
    /*根据社团类型获取社团列表 */
    getTeamsByType() {
      let str = "";
      for (var i = 0; i < this.types.length; i++) {
        str += this.types[i];
      }
      TeamService.getTeamsByType(str).then(res => {
        if (res.code == 0) {
          this.teamList = res.data.records; //社团列表
          this.total = res.data.total; //社团总数
        } else {
          this.$Message.error(res.data);
        }
      });
    },
    /*验证创建社团的请求*/
    validateCreateNewTeam() {
      let vm = this;
      if (vm.create_team_params.applyToName == "") {
        vm.$Message.warning("请填写社团名称哦~");
        return false;
      }
      if (vm.create_team_params.reason == "") {
        vm.$Message.warning("请填写创建理由哦~");
        return false;
      }
      if (vm.create_team_params.contactWay == "") {
        vm.$Message.warning("请填写联系方式方便管理员联系小主哦~");
        return false;
      }
      return true;
    },
    /*发起一个创建新社团的请求*/
    createNewTeam() {
      let vm = this;
      if (!vm.validateCreateNewTeam()) {
        return;
      }
      TeamService.createNewTeamApply(vm.create_team_params).then(res => {
        if (res.code == 0) {
          vm.$Message.success("申请已提交，请小主静候佳音~");
        } else {
          vm.$Message.error(res.msg);
        }
      });
    }
  },
  created() {
    this.getTeams();
  }
};
</script>

<style lang="scss">
.team_card {
  width: 31%;
  height: 220px;
  margin-top: 20px;
  overflow: hidden;
  text-overflow: ellipsis;
}
.team_card img {
  height: 80px;
  display: block;
  margin: 0 auto;
}
.team_card .title {
  text-align: center;
  font-size: 18px;
  font-weight: bold;
  color: $base_color;
  margin-top: 10px;
}
.team_card .summary {
  font-size: 14px;
  margin-top: 10px;
}
.team_right .title {
  margin-left: 10px;
  font-size: 18px;
}
.team_right .input {
  margin-top: 10px;
  margin-left: 10px;
}
// 创建社团申请表
.create_team li.create_item {
  line-height: 50px;
}
.create_team li span.create_title {
  display: inline-block;
  width: 100px;
}
</style>