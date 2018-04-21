<?php
namespace app\api\controller;
use think\db;

class Dynamic extends Common {
	public function get() {
		$data = $this->params;
		if (!isset($data['page'])) {
			$data['page'] = 1;
		}
		if (!isset($data['num'])) {
			$data['num'] = 5;
		}
		$uid = session('user_id');
		$join = [['erhuo_user u', 'u.user_id = d.dynamic_uid']];
		$field = 'dynamic_id, dynamic_content, dynamic_time, dynamic_time, dynamic_type, dynamic_lid, dynamic_gid, dynamic_share, user_id, user_name, user_icon';
		$_db = db('dynamic')->alias('d')->join($join)->field($field)->order('dynamic_time desc');
		if ($data['type'] > 0 && $data['type'] < 3) {
			$_db = $_db->where('dynamic_type', $data['type']);
		}

		if ($data['type'] == 3) {

			$fans_id = $this->get_follower($uid);
			$res = $_db->where('dynamic_uid', 'IN', function ($query) {
				$uid = session('user_id');
				$query->table('erhuo_userrship')->where('fans_id', $uid)->field('followers_id');
			})->page($data['page'], $data['num'])->select();
		} else {
			$res = $_db->page($data['page'], $data['num'])->select();
		}

		// ->chunk(100, function ($item) {
		// 	foreach ($item as $key => $value) {
		// 		$item[$key]['praise_num'] = db('praise')->where('praise_type=1 AND praise_mid=' . $value['dynamic_id'])->count();
		// 		$item[$key]['is_praise'] = db('praise')->where('praise_type=1 AND praise_mid=' . $value['dynamic_id'] . 'AND praise_uid=' . $uid)->find();
		// 	}
		// })
		$total = $_db->count();
		if ($res !== false) {
			$res = $this->arrange_data($res, 'user');
			foreach ($res as $key => $value) {
				// 获得图片
				// $icon = db('gicon')->where('gIcon_gid', $value['goods_id'])->field('gIcon_url')->select();
				// foreach ($icon as $k => $val) {
				// 	$res[$key]['goods_icon'][$k]['url'] = $val['gIcon_url'];
				// }
				$res[$key]['praise_num'] = db('praise')->where('praise_type=1 AND praise_mid=' . $value['dynamic_id'])->count();
				$res[$key]['is_praise'] = db('praise')->where('praise_type=1 AND praise_mid=' . $value['dynamic_id'])->where('praise_uid', $uid)->find() ? true : false;
				$res[$key]['comment_num'] = db('lmsg')->where('lmsg_type=1 AND lmsg_gid=' . $value['dynamic_id'])->count();
				// 商品动态
				if ($res[$key]['dynamic_type'] == 2 && $res[$key]['dynamic_gid'] !== 0) {
					$res[$key]['goods'] = $this->get_one_goods($res[$key]['dynamic_gid'], 1);
				}
				// 转发动态
				if ($res[$key]['dynamic_lid'] !== 0) {
					$res[$key]['children'] = $this->get_one_dynamic($res[$key]['dynamic_lid']);
				}
			}
			$this->return_msg(200, '查询动态成功', $res, $total);
		} else {
			$this->return_msg(400, '查询动态失败', $res);
		}
	}
	public function add() {
		$data = $this->params;
		$uid = $this->login_uid();
		$params['dynamic_time'] = time();
		$params['dynamic_content'] = $data['content'];
		$params['dynamic_uid'] = $uid;
		$params['dynamic_type'] = $data['type'];
		$res = db('dynamic')->insert($params);
		if (!$res) {
			$this->return_msg(400, '发布动态失败');
		} else {
			$id = db('dynamic')->order('dynamic_time desc')->page(1, 1)->find()['dynamic_id'];
			$res = $this->get_one_dynamic($id);
			$this->return_msg(200, '发布动态成功', $res);
		}
	}
	public function delete() {
		$data = $this->params;
		$uid = $this->login_uid();
		$access = session('user_access');
		if ($access == 1) {
			$res = db('dynamic')->where('dynamic_id', $data['id'])->delete();
		} else {
			$res = db('dynamic')->where('dynamic_id', $data['id'])->where('dynamic_uid', $uid)->delete();
		}
		if (!$res) {
			$this->return_msg(400, '删除动态失败');
		} else {
			$this->return_msg(200, '删除动态成功', $res);
		}
	}
	public function share() {
		$data = $this->params;
		$data['dynamic_uid'] = $this->login_uid();
		$data['dynamic_time'] = time();
		$dynamic = $this->has_dynamic($data['dynamic_lid']);
		// 分享的id
		$dynamic_lid = $data['dynamic_lid'];
		// 分享的根id
		$data['dynamic_lid'] = $dynamic['dynamic_id'];
		$data['dynamic_type'] = $dynamic['dynamic_type'];
		$res = db('dynamic')->insert($data);
		if (!$res) {
			$this->return_msg(400, '分享动态失败');
		} else {
			$id = db('dynamic')->order('dynamic_time desc')->page(1, 1)->find()['dynamic_id'];
			$res = $this->get_one_dynamic($id);
			db('dynamic')->where('dynamic_id', $dynamic_lid)->setInc('dynamic_share');
			$this->return_msg(200, '分享动态成功', $res);
		}
	}
	public function get_follower($uid) {
		$res = db('userrship')->where('followers_id', $uid)->value('fans_id');
		if ($res) {
			return $res;
		} else {
			return [];
		}
	}
	public function has_dynamic($id) {
		$res = db('dynamic')->where('dynamic_id', $id)->find();
		if ($res) {
			if ($res['dynamic_lid'] == 0) {
				return $res;
			} else {
				return $this->has_dynamic($res['dynamic_lid']);
			}
		} else {
			$this->return_msg(400, '您的分享内容未找到');
		}
	}
}