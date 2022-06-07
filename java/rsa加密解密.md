1. 代码
    ```java
    import java.util.Base64;
    import javax.crypto.SecretKey;
    import javax.crypto.KeyGenerator;
    import javax.crypto.NoSuchPaddingException;
    import javax.crypto.BadPaddingException;
    import javax.crypto.Cipher;
    import javax.crypto.IllegalBlockSizeException;

    import java.security.PublicKey;
    import java.security.PrivateKey;
    import java.security.InvalidKeyException;
    import java.security.KeyFactory;
    import java.security.NoSuchAlgorithmException;
    import java.security.spec.InvalidKeySpecException;
    import java.security.spec.X509EncodedKeySpec;
    import java.security.spec.PKCS8EncodedKeySpec;

    public class test {
        static SecretKey aesKey = null;
        static SecretKey hmacKey = null;
        static String aesKeyEncrypted = null;
        static String hamcKeyEncryped = null;
        // rsa加密
        public static void initEncryptKey() throws NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
            // 生成aeskey
            KeyGenerator keyGen = KeyGenerator.getInstance("AES");
            aesKey = keyGen.generateKey();
            System.out.println(Base64.getEncoder().encodeToString(aesKey.getEncoded()));
            // 生成hmackey
            KeyGenerator hmacKeyGen = KeyGenerator.getInstance("HmacSHA256");
            hmacKey = hmacKeyGen.generateKey();
            System.out.println(Base64.getEncoder().encodeToString(hmacKey.getEncoded()));
            String key=null;
            // 公钥
            key="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4ILnVG6ONjVqYkkOBt8TItl922u4Ym+diz6pvsx4cjc2zweQvN0y8B1rAsG+36lBBs68hWD0PF8dMkFGzJehKJvqPhx2spaRhwMWRhdOmY5G75K9r4dPm7T1Y+R0fVr6Ctl6TWvIdNN1yYzvp24zzzhmj5e/oSFx1zjraolvfYiVbOuZzpDaygOMPU8zh08SETXpVFJ1PhMpIx5WkKAqsb6LP8okoa9r2W5fmk3WjPRTEYjrvQPArXkMOOGc+kJRSiX4gTz304Pr/CGPf6anR5Li8wes28dhwghlo7/UFxNmvgewN98803RZQAOQe1ZbMrnXZ5AGVhNAL4mrUBAi/wIDAQAB";
            X509EncodedKeySpec keySpec =new X509EncodedKeySpec(Base64.getDecoder().decode(key));

            KeyFactory factory = KeyFactory.getInstance("RSA");
            PublicKey rsaKey = factory.generatePublic(keySpec);
            // 选择加密方法
            Cipher rsaInstance = Cipher.getInstance("RSA/ECB/PKCS1PADDING");
            rsaInstance.init(1, rsaKey);
            aesKeyEncrypted = Base64.getEncoder().encodeToString(rsaInstance.doFinal(aesKey.getEncoded()));
            hamcKeyEncryped = Base64.getEncoder().encodeToString(rsaInstance.doFinal(hmacKey.getEncoded()));
            System.out.println(aesKeyEncrypted);
            System.out.println(hamcKeyEncryped);
        }

        public static void decrypt() throws NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException{
            String key=null;
            // 私钥
            key="MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDggudUbo42NWpiSQ4G3xMi2X3ba7hib52LPqm+zHhyNzbPB5C83TLwHWsCwb7fqUEGzryFYPQ8Xx0yQUbMl6Eom+o+HHaylpGHAxZGF06Zjkbvkr2vh0+btPVj5HR9WvoK2XpNa8h003XJjO+nbjPPOGaPl7+hIXHXOOtqiW99iJVs65nOkNrKA4w9TzOHTxIRNelUUnU+EykjHlaQoCqxvos/yiShr2vZbl+aTdaM9FMRiOu9A8CteQw44Zz6QlFKJfiBPPfTg+v8IY9/pqdHkuLzB6zbx2HCCGWjv9QXE2a+B7A33zzTdFlAA5B7VlsyuddnkAZWE0AviatQECL/AgMBAAECggEBAJNguxRswoQJSn2ccU3HcBtnZDv+mXpcxLGcf/dU6Bgp8Ju03qlsFz0SQqX7ox3VUG90lMKFo65hzZuoyB4Tx2IN/5WoP676MivLtfpq4Fji0eQAku4/x91xy8g4NtP3Pb6Thrp974fpLCATmVpyeCYmYwUN22iduMpMfhVghMSFAlfPULFleCx9OP2fr5gEYP5J6zzgvbr9MUFKMUFDwHjMzVsCnM0ru34XiyIBsQvKRX+zfwKF4hLaAIr21J4GRSiB6kRsXPWXoqU5xWGVVwH+GLrWQLedMcY7TTbjePDqiIS/KnxasPFILvZImoZpIrh6BAqSnK7dy81z/5KBoYkCgYEA+9PbLauWGWbj1GQaHm+SudDv6rlHZ4ZrZxWCJuE8UuQMPn1VdW0fjTOw6GYHkwOIY4Z+1op/hAHlkBCWJPeJbfR3Qnd2UP1dlyQfwEd1ICFO6qqHlfncVAXmeXVEivB5T4j7Nsfi3/t2mGQ3ErkKzz4LPe6bPyXzjeXDjOqtR9UCgYEA5DsvEJ5PcNKQZUFbOvO8H98MIMHaXkWkge7KFHJTOX2taFRq9lcBuWXXsELUpKEsqVUV4nBR50Zl3ZAMA6dgIMgfpgXtm560Yd7UdNoTJAdVcUJJvUqT2fxwo+MGLGCeBXqQt/4peOafehFTrX6UWe56JeKHCrfiLOL0eT8cXYMCgYBpsz7oKIFUIC+40lt0MvivLdfF+gbSmUUze3+puhiL4lSRViIsq6T2q5+xrEG5n138CFPs0S08x18H3S5oTc5NbLMyHtp2nCJQckUxe8zZs6FgNju646lrSx62FFa0ysLgc2qeT8AWq4HX7RiAr1KuMiid0i0vkEpuYOZ3m3koEQKBgCnaOI1BmqvD0TrgO0yaOZtWmbDAG71B5CL3mRMay+w1AcGqCVtXJTfMVzs5ZikybTA4LCU0F7DjlfaFXc6luNkKGdOmLqZk+gsgg7FR9ESdG6wDTeZqcKZ+xmEnVpB4v0Gd8j/rWcuT7xbBaqjcF3ROaRPdcIokolM84zwAuMDlAoGBALc5pdTvq1GTws9LaWXtgMNDUgQEg4ZC9BGvKgk4VcowVZwRGf7ipQZGMLP5kTDA1pM4RWoHFm20e5LqW1Ec0L+4Ein4yyWTgp4+cc3kUYA/WE6k7tB37xebK9vP9fsxr36TDUz8Z5PU1r0YkccLgK5dPHTejelUSGbtWnNd8e1Z";
            PKCS8EncodedKeySpec keySpec =new PKCS8EncodedKeySpec(Base64.getDecoder().decode(key));

            KeyFactory factory = KeyFactory.getInstance("RSA");
            PrivateKey rsaKey = factory.generatePrivate(keySpec);

            Cipher rsaInstance = Cipher.getInstance("RSA/ECB/PKCS1PADDING");
            rsaInstance.init(Cipher.DECRYPT_MODE, rsaKey);
            String aesKeyStr = Base64.getEncoder().encodeToString(rsaInstance.doFinal(Base64.getDecoder().decode("e4dOKDtIchsmEarkhcRRxcucdts4/ELsljYGNEdHLocWWF7fFohHwLheo9PpqmMAbJk3ffjVsQQp6ZkES1is5/BkpRLpzrgIjocoafkKsATquzlJ65MNr7o1bGYFX19dN10dYrIuVi1g4jbBQNY3uKCr/usuy8Nlj+DXWScRCgcPeRj3qytQk/ckdtGNDQPUXIlSROsPQPMwCt2C9BfmB5SWFqzKmD5sOfgSUPtleVmcNTtoJYQTw3ttLGXZWknW7eMhqfvqy+YSN03pcB2LPqYEo88bPhNXnaozhJLQKWN93U+k4/ZXU1TEyZMd/+6bBBL8mhVyNhRBdO3bwqCDDw==")));
            String hamcKeyStr = Base64.getEncoder().encodeToString(rsaInstance.doFinal(Base64.getDecoder().decode("eEEphAVF1oPPDTdPNCrwHEHm6stZ7+GuxtL+1GYlBDS7vKv336dW9ZlMg8VScZLHuXVeJBXDxXMS+YM1upBi4MTmaASBHw+U6lSptLbfZoNtaKpWgGTOfUiu2QCjg9G5u3yaWAT2TJRlhU2jOFkuhsySkneKr/QdN4d1LlsTCw/5Ss3s0OB5q0tk2/mVsRoMsCl21NsErQ9jwndL2Qmc1i7aP1/PtXxfya04bcp9R0jF9fSaHf3RGfxQRR0vON4di5Q9moz+sbYDPN7ZhJhlt0FVmU/iWrWDaer1hy8fpAxmqLhVz83yOfN6E5fYmOPytLH82ToDD1xQfPU6plZEdw==")));
            System.out.println(aesKeyStr);
            System.out.println(hamcKeyStr);
        }

        public static void main(String[] args) throws InvalidKeyException, NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException {
            test.decrypt();
        }
    }
    ```