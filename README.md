# Brain Tumor Detection from MRI using Deep Learning

Bu proje, **MRI görüntülerinden beyin tümörü tespiti** amacıyla geliştirilmiş bir derin öğrenme sistemidir. MATLAB kullanılarak geliştirilen projede, farklı sinir ağı mimarileri ve optimizasyon algoritmaları karşılaştırmalı olarak analiz edilmiştir.

---

## Veri Seti

Kullanılan veri seti: **Brain MRI Images for Brain Tumor Detection**  
Yapı:

```
Brain MRI Images for Brain Tumor Detection/
├── yes/    # Tümör içeren MRI görüntüleri
└── no/     # Tümör içermeyen MRI görüntüleri
```

Görüntüler otomatik olarak klasör adlarına göre etiketlenmiştir.

---

## Kullanılan Modeller

Projede iki farklı sinir ağı mimarisi kullanılmıştır:

- **MobileNetV2**: Hafif ve önceden eğitilmiş bir model (transfer learning)
- **MyCNN**: Sıfırdan tasarlanmış, özel bir konvolüyonel sinir ağı (custom CNN)

---

## Optimizasyon Algoritmaları

Her bir model üç farklı algoritma ile ayrı ayrı eğitilmiştir:

1. **Adam**
2. **SGDM** (Stochastic Gradient Descent with Momentum)
3. **RMSprop**

Toplamda **6 farklı eğitim sonucu** elde edilmiştir.

---

## Arayüz Özelliği

MATLAB arayüzü (GUI) üzerinden:

- Eğitim sonuçları görsellenebilir
- Farklı model ve algoritmalar seçilerek test yapılabilir
- Tahmin edilen sınıf ve güven skoru kullanıcıya gösterilir

---

## Eğitim & Değerlendirme

- Eğitim verisi %70, doğrulama %15, test %15 oranında ayrılmıştır.
- Görüntüler `rgb2gray` ile griye çevrilmiştir.
- `augmentedImageDatastore` kullanılarak veri genişletme (augmentation) sağlanmıştır.
- Eğitimde `crossentropy` kayıp fonksiyonu kullanılmıştır.

### Örnek Değerlendirme:

- Model: MobileNetV2  
- Algoritma: Adam  
- Doğruluk: %93.1  
- Confusion Matrix: Otomatik çizilir

---

## Kullanılan Teknolojiler

- MATLAB (Deep Learning Toolbox, Image Processing Toolbox)
- Transfer Learning
- GPU hızlandırma (opsiyonel)

---

## Test Edilen Özellikler

- Tek görsel yükleyerek sınıflandırma
- Karşılaştırmalı model/algoritma seçimi
- Eğitim süreci ve doğruluk kıyaslamaları
- Confusion matrix ile doğruluk analizi


---

## Arayüz

> Arayüzde model ve algoritma seçimi yapılabilir, tek tıkla sınıflandırma sonucu alınabilir.

![Screenshot from 2025-04-19 21-32-22](https://github.com/user-attachments/assets/951f1af1-697d-4c34-adbd-7a9409a9d2a0)


---

## Notlar

- `trainedNet` bir `dlnetwork` nesnesidir. `classify()` değil, `predict()` fonksiyonu kullanılmalıdır.
- Kanal uyumsuzluğu hatalarına karşı veri doğru şekilde normalize edilmelidir.
- Model giriş boyutlarına uygun olarak `rgb2gray` veya `gray2rgb` dönüşümü yapılmalıdır.

---
