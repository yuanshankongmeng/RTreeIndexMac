//
//  Enums.h
//  RTreeIndexMac
//
//  Created by zhoudong on 11-9-27.
//  Copyright 2011年 tg. All rights reserved.
//


typedef enum
{
	ZDGistRTreePoint,
	ZDGistRTreeRectangle
	
}GistIndexType;

typedef enum {
    rt_point_ext_id,	// Point type Id
    rt_rect_ext_id,		// Rectangle type Id
    gist_numext			// Reserved
    
}GistExtentionId;
