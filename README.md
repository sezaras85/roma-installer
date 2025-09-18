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

# 2-DOCKER DESKTOP KURULUMU
https://www.docker.com/products/docker-desktop/ adresine gidin. ''Download Docker Desktop'' kısmından windows için dockeri yükleyin. yükleme bittikten sonra masaüstü sağ alt köşede Docker desktop running yazması lazım. 





<img width="1885" height="763" alt="docker" src="https://github.com/user-attachments/assets/76935b53-4bae-4c6e-bf34-fe689b12e92f" />
<img width="707" height="401" alt="docker setup" src="https://github.com/user-attachments/assets/6ddb4223-6dfd-4983-8fb8-5ad2602e1b98" />


daha sonra sağ üst köşede ayarlar simgesine tıklayın. Resources kısmından WSL integration kısmından ubuntuyu aktif ederek restart&apply tuşuna basarak ubuntuyu aktif edin.




<img width="1890" height="966" alt="docker ubuntu aktif" src="https://github.com/user-attachments/assets/7fcf0b2e-c240-491c-85ba-f41464c1cd60" />


Daha sonra arama kısmına ubuntu yazarak çalışıtırın. sizden kullanıcı adı ve parola belirlemenizi isteyecek. herhangi bir kullanıcı adı ve parola yazın. 


<img width="947" height="396" alt="ubuntu kullanıc paralo" src="https://github.com/user-attachments/assets/e04fb3a3-4b99-483d-a5b3-80d5c9811cb0" />

Daha sonra terminal satırına şu kodları kopyalayıp yapıştırın. şifre isterse az önce belirlediğiniz şifreyi yazın

```Bash
sudo apt update && sudo apt upgrade -y
sudo apt install git docker.io docker-compose -y
```

<img width="945" height="491" alt="güncelleme ubuntu" src="https://github.com/user-attachments/assets/8a180d7d-253f-480a-92a9-f89b2b1a922e" />


Daha sonra aşağıdaki komutları sırasıyla yazın terminal ekranına

```Bash
git clone https://github.com/sentient-agi/ROMA.git
cd ROMA

./setup.sh --docker

```


<img width="946" height="493" alt="git roma1" src="https://github.com/user-attachments/assets/486f425e-134f-415e-b50d-f17ffa39a08b" />









