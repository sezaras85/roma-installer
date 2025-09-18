#!/bin/bash
set -e

echo "=== ROMA Otomatik Kurulum Scripti Başlıyor ==="

# Root izni kontrolü
if [ "$EUID" -ne 0 ]
  then echo "Lütfen root veya sudo ile çalıştırın!"
  exit
fi

# 1. Sistem güncelleme ve gerekli paketler
echo "[1/7] Paketler güncelleniyor..."
apt update && apt upgrade -y
apt install -y git docker.io docker-compose

# 2. ROMA reposunu klonla
echo "[2/7] ROMA indiriliyor..."
if [ ! -d "ROMA" ]; then
  git clone https://github.com/sentient-agi/ROMA.git
fi

cd ROMA

# 3. ROMA setup
echo "[3/7] ROMA kurulumu başlatılıyor..."
chmod +x setup.sh
./setup.sh --docker

# 4. Docker ilk çalıştırma
echo "[4/7] Docker Compose başlatılıyor..."
cd docker
docker compose up -d
cd ..

# 5. Kullanıcıdan API key alma
echo ""
read -p "👉 Lütfen OpenRouter API Key girin: " OPENROUTER_API_KEY

echo "[5/7] .env dosyaları güncelleniyor..."
# Ana .env
if grep -q "OPENROUTER_API_KEY=" .env; then
  sed -i "s|^OPENROUTER_API_KEY=.*|OPENROUTER_API_KEY=${OPENROUTER_API_KEY}|" .env
else
  echo "OPENROUTER_API_KEY=${OPENROUTER_API_KEY}" >> .env
fi

# Docker .env
if grep -q "OPENROUTER_API_KEY=" docker/.env; then
  sed -i "s|^OPENROUTER_API_KEY=.*|OPENROUTER_API_KEY=${OPENROUTER_API_KEY}|" docker/.env
else
  echo "OPENROUTER_API_KEY=${OPENROUTER_API_KEY}" >> docker/.env
fi

# 6. Kullanıcıdan model id alma
echo ""
read -p "👉 Lütfen kullanmak istediğiniz model id girin (örn: openrouter/anthropic/claude-3.5-sonnet): " MODEL_ID

echo "[6/7] agents.yaml güncelleniyor..."
AGENT_CONFIG="src/sentientresearchagent/hierarchical_agent_framework/agent_configs/agents.yaml"
if [ -f "$AGENT_CONFIG" ]; then
  sed -i "s|model_id:.*|model_id: ${MODEL_ID}|g" "$AGENT_CONFIG"
else
  echo "Uyarı: $AGENT_CONFIG bulunamadı!"
fi

# 7. sentient.yaml güncelleme
echo "[7/7] sentient.yaml güncelleniyor..."
if [ -f "sentient.yaml" ]; then
  sed -i 's|api_key:.*|api_key: "${OPENROUTER_API_KEY}"|g' sentient.yaml
else
  echo "Uyarı: sentient.yaml bulunamadı!"
fi

# Docker yeniden başlatma
echo "Docker yeniden başlatılıyor..."
cd docker
docker compose down
docker compose up -d

echo ""
echo "=== ROMA Kurulum Tamamlandı ✅ ==="
echo "ROMA başarıyla çalışıyor!"
