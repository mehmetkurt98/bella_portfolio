# Bella Portfolio

Versace tarzında lüks, minimal bir kişisel portföy sitesi — Flutter Web.

## Yerel çalıştırma

```bash
cd ~/Projects/bella_portfolio
flutter pub get
flutter run -d chrome
```

## Vercel'e deploy (ücretsiz)

### İlk kurulum (bir kez)

1. [vercel.com](https://vercel.com) üzerinde ücretsiz hesap açın (GitHub ile giriş en kolayı).
2. Terminalde deploy script'ini çalıştırın:

```bash
cd ~/Projects/bella_portfolio
./scripts/deploy-vercel.sh
```

3. İlk seferde tarayıcıda Vercel girişi isteyecek — onaylayın.
4. Proje adı sorulursa `bella-portfolio` yazabilirsiniz.
5. Bittiğinde terminalde canlı link görünür: `https://bella-portfolio.vercel.app`

### Sonraki güncellemeler

Kod değiştirdikten sonra aynı komutu tekrar çalıştırmanız yeterli:

```bash
./scripts/deploy-vercel.sh
```

## Kendi domain'inizi bağlama

1. Vercel Dashboard → projeniz → **Settings → Domains**
2. Domain adınızı ekleyin (ör. `bellaportfolio.com`)
3. Vercel'in verdiği DNS kayıtlarını domain sağlayıcınıza (GoDaddy, Namecheap vb.) girin
4. Birkaç dakika–24 saat içinde site domain'inizde açılır (SSL otomatik)

## İçerik düzenleme

Tüm metin, proje ve linkler:

- `lib/data/sample_data.dart`

## Proje yapısı

- `lib/theme/` — renkler ve tipografi
- `lib/widgets/` — sayfa bileşenleri
- `lib/screens/home_screen.dart` — ana sayfa
- `vercel.json` — Vercel yönlendirme ayarları
