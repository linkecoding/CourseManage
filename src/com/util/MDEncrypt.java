package com.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MDEncrypt {
	public static String mdEncrypt(String src){
		String res = null;
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
			if(src != null){
				byte[] mdBytes = md.digest(src.getBytes());
				res = HexUtil.bytesToHexString(mdBytes);
			}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
}
