package com.ssm.vaccinum.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * 文件操作类
 * 
 * @author hwadee
 *
 */
public class FileUtil {

	/**
	 * 上传单个文件
	 * @param file
	 * @param path
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public static String uploadFile(CommonsMultipartFile file,String path) throws IllegalStateException, IOException{
		File newFilePath = new File(path);
		if (!newFilePath.exists()){
			if(!newFilePath.mkdirs()){
				return "error:目录创建失败:"+path;
			}
		}
		File newFile = new File(path+"/"+file.getOriginalFilename());
		file.transferTo(newFile);
		return newFile.getPath();
	}
	
	/**
	 * 上传多个文件 
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public static String  uploadPluralFile(HttpServletRequest request,String path) throws IllegalStateException, IOException {
//		long startTime = System.currentTimeMillis();		
		// 将当前上下文初始化给 CommonsMutipartResolver（多部分解析器）
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());

		// 检查form中是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			File newFilePath = new File(path);
			if (!newFilePath.exists()){
				if(!newFilePath.mkdirs()){
					return "error:目录创建失败:"+path;
				}
			}
			// 将request变成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			
			// 获取multiRequest 中所有的文件名
			Iterator<String> iter = multiRequest.getFileNames();
			List<String> fileNameList = new ArrayList<>();
			// 遍历所有文件
			while (iter.hasNext()) {
				// 获取一个文件
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					String fileName = file.getOriginalFilename();
					String newPath = path + "/" + fileName;
					// 上传
					file.transferTo(new File(newPath));
					fileNameList.add(newPath);
				}
			}
			return fileNameList.toString();
		}
		return "error:没有上传的文件！！";
	}
}
