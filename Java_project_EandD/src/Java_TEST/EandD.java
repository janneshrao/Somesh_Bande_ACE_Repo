package Java_TEST;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

import javax.crypto.Cipher;

public class EandD{
	public static void main(String args[]) {
		generate_keys();
		decryptData();
	}



	public static Boolean generate_keys(){
		try{
		KeyPairGenerator keyPairGEN =KeyPairGenerator.getInstance("RSA");
		keyPairGEN.initialize(2048);
		KeyPair keyPair=keyPairGEN.generateKeyPair();
		PublicKey PublicKey=keyPair.getPublic();
		PrivateKey PrivateKey=keyPair.getPrivate();
		
		
		SavePublicKeyToFile(PublicKey,"public_key.der");
		SavePrivateKeyToFile(PrivateKey, "private_key.der");
		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	private static void SavePrivateKeyToFile(PrivateKey pivateKey,String File_Name) {
		try {
			byte[] privateKeyEncoded =pivateKey.getEncoded();
			FileOutputStream fos=new FileOutputStream(File_Name);
			fos.write(privateKeyEncoded);
			fos.close();
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private static void SavePublicKeyToFile(PublicKey publicKey,String File_name) {
		try {
			byte[] publicKeyEncoded = publicKey.getEncoded();
			FileOutputStream fos=new FileOutputStream(File_name);
			fos.write(publicKeyEncoded);
			fos.close();
			}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void encryptData(byte[] input) {
		try {
			PublicKey publicKey= loadPublicKeyFromFile("C:/Users/Sreenivas Bandaru/IBM/ACET12/workspace/Java_project_EandD/public_key.der");
			Cipher cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.ENCRYPT_MODE,publicKey);
			byte[] encryptData=cipher.doFinal(input);
			FileOutputStream fos=new FileOutputStream("C:/Users/Sreenivas Bandaru/IBM/ACET12/workspace/Java_project_EandD/encrytData.txt");
			fos.write(encryptData);
			fos.close();
			System.out.println("done");
			
		}
		catch (Exception e) {
			e.printStackTrace();
		
		}
	}
	private static PublicKey loadPublicKeyFromFile(String File_name) throws Exception{
		FileInputStream fis=new FileInputStream(File_name);
		byte[] publicKeyEncoded = new byte[fis.available()];
		fis.read(publicKeyEncoded);
		fis.close();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		return keyFactory.generatePublic(new X509EncodedKeySpec(publicKeyEncoded));
		
	}
	public static byte[] decryptData() {
		try {
			PrivateKey privateKey= loadPrivateKeyFromFile("C:/Users/Sreenivas Bandaru/IBM/ACET12/workspace/Java_project_EandD/private_key.der");
			FileInputStream fis=new FileInputStream("C:/Users/Sreenivas Bandaru/IBM/ACET12/workspace/Java_project_EandD/encrytData.txt");
			byte[] encryptData=new byte[fis.available()];
			fis.read(encryptData);
			fis.close();
						
			Cipher cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.DECRYPT_MODE,privateKey);
			
			byte[] decryptData= cipher.doFinal(encryptData);
			
			return decryptData;
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	private static PrivateKey loadPrivateKeyFromFile(String File_name) throws Exception{
		FileInputStream fis=new FileInputStream(File_name);
		byte[] privateKeyEncoded = new byte[fis.available()];
		fis.read(privateKeyEncoded);
		fis.close();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		return keyFactory.generatePrivate(new PKCS8EncodedKeySpec(privateKeyEncoded));
		
	}
}	
