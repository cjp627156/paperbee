package com.definesys.bees.test.HotDeploy;

import org.apache.tomcat.util.http.fileupload.FileUtils;

import java.io.*;

public class MyClassLoader extends ClassLoader {
    private static final String BASE_DIR="C:\\Users\\98077\\Desktop\\新技术\\Bees\\springBoot\\bees\\target\\classes\\";

    private static byte[] readFileToByteArray(String fileName)throws IOException{
        InputStream input=new FileInputStream(fileName);
        ByteArrayOutputStream output=new ByteArrayOutputStream();
        try {
            copy(input,output);
            return output.toByteArray();
        }finally {
            input.close();
        }
        }

        private static void copy(InputStream input, OutputStream output)throws IOException{
        byte[] buf=new byte[4096];
        int bytesRead=0;
        while ((bytesRead=input.read(buf))!=-1){
            output.write(buf,0,bytesRead);
        }
        }

    @Override
    protected Class<?> findClass(String name) throws ClassNotFoundException {
        String fileName = name.replaceAll("\\.", "\\");
        fileName = BASE_DIR + fileName + ".class";
        try {
            byte[] bytes=readFileToByteArray(fileName);
            return defineClass(name,bytes,0,bytes.length);
        }catch (IOException ex){
            throw new ClassNotFoundException("failed to load class"+name,ex);
        }
    }
}
