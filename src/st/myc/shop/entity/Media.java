/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package st.myc.shop.entity;

import java.util.Date;

import st.myc.shop.constant.MediaConstant;

//TODO media
public class Media {

	private int mediaId;
	private int kindId;
	private String name;
	private String path;
	private Long size;
	private MediaConstant.Type type;
	private MediaConstant.Kind kind;
	private Date createTime;

	public int getMediaId() {
		return mediaId;
	}

	public void setMediaId(int mediaId) {
		this.mediaId = mediaId;
	}

	public int getKindId() {
		return kindId;
	}

	public void setKindId(int kindId) {
		this.kindId = kindId;
	}

	public MediaConstant.Kind getKind() {
		return kind;
	}

	public void setKind(MediaConstant.Kind kind) {
		this.kind = kind;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Long getSize() {
		return size;
	}

	public void setSize(Long size) {
		this.size = size;
	}

	public MediaConstant.Type getType() {
		return type;
	}

	public void setType(MediaConstant.Type type) {
		this.type = type;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
