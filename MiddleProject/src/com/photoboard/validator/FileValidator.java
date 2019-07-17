package com.photoboard.validator;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.photoboard.vo.PBoardVo;

@Service("fileValidator")
public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object uploadFile, Errors errors) {
		PBoardVo file = (PBoardVo) uploadFile;
		if (file != null) {
			if (file.getFile().getSize() == 0) {
				errors.rejectValue("file", "PhotoBoardPost", "파일이 존재하지 않습니다.");
			}
		}

	}

}
