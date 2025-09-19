# Sentient ROMA - Türkçe Kurulum Rehberi

Bu Rehberi Neden Hazırladım? Bildiğiniz gibi ROMA, Sentient ekibi tarafından geliştirilen açık kaynaklı bir meta-ajan çerçevesi (framework). Amacı: birden fazla hafif ajanın birlikte çalışarak yüksek düzeyde performanslı, karmaşık görevleri çözmesi. Ekip ROMA kurulumu için bir github rehberi hazırladı ve github trendlerde 1 numaraya ulaştı. Ancak herkesin kolayca kurabileceği bir rehber bulunmamaktadır. Herkesin ROMA yı kurup deneyimlemesi için bu rehberi hazırladım. Bu rehberdeki basit adımları uygulayarak ROMA yı bilgisayarınızda çalışıtrabilir ve karmaşık görevleri nasıl çözdüğüne bizzat şahit olabilirsiniz. Hadi başlayalım... 


# 1-UBUNTU KURULUMU
Microsoft Storeden uygulamalardan ubuntuyu aratarak yükleyin
.
.
.
<img width="1873" height="934" alt="ubuntu mic skur" src="https://github.com/user-attachments/assets/7dc0347c-05b1-417e-a596-45c996f81e22" />


# 2-Openrouter hesap oluşturma

https://openrouter.ai/ adresine gidirek google hesabınızla oturum açın. Sağ üst köşeden ayarlar kısmından API keye gelin ve create api keye basarak api keyinizi oluşturun. sk- ile başlayan api keyinizi bir yere not alın. ekranı kapattıktan sonra api keyinizi bir daha göremiyorsunuz dikkat edin.

<img width="1860" height="913" alt="openrouter keys" src="https://github.com/user-attachments/assets/ea75ee63-90a6-4721-af76-fc4bf0ecb121" />
<img width="1813" height="745" alt="openrotuer sk key" src="https://github.com/user-attachments/assets/0df772f4-4588-4cbc-9596-5c989bad222a" />

# 3-DOCKER DESKTOP KURULUMU
https://www.docker.com/products/docker-desktop/ adresine gidin. ''Download Docker Desktop'' kısmından windows için dockeri indirip bilgisayarınıza yükleyin. yükleme bittikten sonra masaüstü sağ alt köşede Docker desktop running yazması lazım. Hata verirse kapatıp tekrar açın güncelleme yapıp çalışması lazım.





<img width="1885" height="763" alt="docker" src="https://github.com/user-attachments/assets/76935b53-4bae-4c6e-bf34-fe689b12e92f" />
<img width="707" height="401" alt="docker setup" src="https://github.com/user-attachments/assets/6ddb4223-6dfd-4983-8fb8-5ad2602e1b98" />


Daha sonra sağ üst köşede ayarlar simgesine tıklayın. Resources kısmından WSL integration kısmından ubuntuyu aktif ederek restart&apply tuşuna basarak ubuntuyu aktif edin.




<img width="1890" height="966" alt="docker ubuntu aktif" src="https://github.com/user-attachments/assets/7fcf0b2e-c240-491c-85ba-f41464c1cd60" />


Şimdi bilgisyarınızın arama kısmına ubuntu yazarak daha önce yüklediğimiz ubuntu programını çalışıtırın. terminal komut ekranı açılacak ve sizden kullanıcı adı ve parola belirlemenizi isteyecek. herhangi bir kullanıcı adı ve parola yazın. 


<img width="947" height="396" alt="ubuntu kullanıc paralo" src="https://github.com/user-attachments/assets/e04fb3a3-4b99-483d-a5b3-80d5c9811cb0" />

Daha sonra terminal satırına şu kodları tek tek kopyalayıp yapıştırın. şifre isterse az önce belirlediğiniz şifreyi yazın

```Bash
sudo apt update && sudo apt upgrade -y
sudo apt install git docker.io docker-compose -y
```

<img width="945" height="491" alt="güncelleme ubuntu" src="https://github.com/user-attachments/assets/8a180d7d-253f-480a-92a9-f89b2b1a922e" />


Daha sonra aşağıdaki komutları sırasıyla yazın terminal ekranına. yaklaşık 10 dakika sürüyor yüklenmesi ekranı kapatmadan bekleyin.

```Bash
git clone https://github.com/sentient-agi/ROMA.git
cd ROMA

./setup.sh --docker

```


<img width="946" height="493" alt="git roma1" src="https://github.com/user-attachments/assets/486f425e-134f-415e-b50d-f17ffa39a08b" />

<img width="947" height="491" alt="roma yüklendi" src="https://github.com/user-attachments/assets/cc0387b4-855f-42ca-a66e-c90df24a1f64" />

Yükleme tamamlandıktan sonra aşağıdaki kodları sırasıyla yazın terminal ekranında. 


```Bash
cd
cd ROMA
sed -i 's/api_key: "your-openrouter-key"/api_key: "${OPENROUTER_API_KEY}"/' sentient.yaml
```

<img width="950" height="383" alt="sentient yaml2" src="https://github.com/user-attachments/assets/9ee330f1-6c41-4c1e-b48b-9f8137dfc6a4" />


Şimdi api keyimizi yazalım. YUkarıda openrouterden api keyimizi almıştık. şimdi aşağıda "sk_ile_başlayan_api_keyi_yaz" kısmını düzelterek kendi sk- ile başlayan api keyinizi yazın. api keyinizi yazdıktan sonra komutu kopyalayıp terminale yapıştırın

```Bash
cd
cd ROMA
sed -i 's/OPENROUTER_API_KEY=your_openrouter_key_here/OPENROUTER_API_KEY=sk_ile_başlayan_api_keyi_yaz/' .env

```
<img width="1900" height="666" alt="api keyi yaz tek komut" src="https://github.com/user-attachments/assets/424a2c7d-ad3a-4dd5-8b1e-369d5ecc1f95" />

şimdi model id düzenlemeye geçelim. aşağıdaki komutları sırayla terminale yapıştırın

```Bash
cd
cd ~/ROMA/src/sentientresearchagent/hierarchical_agent_framework/agent_configs
sed -i 's/model_id:.*".*"/model_id: "openrouter\/deepseek\/deepseek-chat-v3.1:free"/g' agents.yaml openrouter/deepseek/deepseek-chat-v3.1:free

```

<img width="952" height="356" alt="model id" src="https://github.com/user-attachments/assets/8cd4fbbf-a997-4184-ac86-7528d1f76c8e" />

şimdi ROMA yı başlatmaya hazırız. aşağıdaki kodları sırasıyla terminal ekranına yazın. 2-3 dakika bekleyin.

```Bash
cd
cd ROMA
cd docker
docker compose down
docker compose up -d

```

<img width="950" height="443" alt="docker restart" src="https://github.com/user-attachments/assets/a7377f73-043d-4524-b73c-e75ba458c903" />

Kurulumda bir hata olup olmadığını kontrol etmek için logları kontrol edelim. yine docker klasöründe aşağıdaki komutu çalıştırın. herşey yolundaysa aşağıdaki ekranı görmeniz lazım. daha sonra ctrl+c ye basarak çıkabilirsiniz.

```Bash
docker compose logs -f

```

<img width="951" height="503" alt="log kontrol" src="https://github.com/user-attachments/assets/d99af0ae-ae87-4170-a47d-8462d447b003" />


şimdi tarayıcınızdan http://localhost:3000/ adresine gidin ve ROMA yı kullanmaya başlayın...

<img width="949" height="470" alt="roma tamam" src="https://github.com/user-attachments/assets/e020ddc0-1c27-4aca-a1ed-ae4698a675f2" />








