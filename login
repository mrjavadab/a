<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ثبت نام در سامانه کهن‌بن</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vazirmatn:wght@400;500;700;800&display=swap" rel="stylesheet">
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <style>
        body {
            font-family: 'Vazirmatn', sans-serif;
            background-color: #f1f5f9; /* slate-100 */
        }
        .signup-gradient {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
        }
        .input-group {
            position: relative;
        }
        .input-icon {
            position: absolute;
            top: 50%;
            left: 1rem;
            transform: translateY(-50%);
            color: #94a3b8; /* slate-400 */
            cursor: pointer;
        }
        .form-input {
            @apply w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-lg text-slate-800 focus:outline-none focus:ring-2 focus:ring-teal-500 transition-colors duration-300;
        }
        .form-checkbox {
            @apply w-5 h-5 text-teal-600 bg-gray-100 border-gray-300 rounded focus:ring-teal-500;
        }
        .error-message {
            @apply text-red-500 text-xs mt-1;
        }
        /* Styles for valid/invalid inputs */
        .input-invalid {
            @apply border-red-500 focus:ring-red-500;
        }
        .input-valid {
            @apply border-green-500 focus:ring-green-500;
        }
        /* Password Strength Meter */
        .strength-meter {
            @apply h-2 w-full bg-slate-200 rounded-full mt-2;
        }
        .strength-bar {
            @apply h-full rounded-full transition-all duration-300;
        }
        .strength-weak { @apply w-1/3 bg-red-500; }
        .strength-medium { @apply w-2/3 bg-yellow-500; }
        .strength-strong { @apply w-full bg-green-500; }

        /* Spinner for button */
        .spinner {
            display: inline-block;
            border: 2px solid rgba(255,255,255,0.3);
            border-radius: 50%;
            border-top-color: #fff;
            width: 16px;
            height: 16px;
            animation: spin 1s ease-in-out infinite;
        }
        @keyframes spin {
            to { transform: rotate(360deg); }
        }
    </style>
</head>
<body class="antialiased">

    <div class="min-h-screen flex items-center justify-center p-4">
        <div class="w-full max-w-4xl mx-auto bg-white rounded-2xl shadow-2xl overflow-hidden grid grid-cols-1 md:grid-cols-2">
            
            <!-- Left Panel: Branding -->
            <div class="hidden md:flex flex-col items-center justify-center p-12 signup-gradient text-white text-center">
                <h1 class="text-5xl font-extrabold">کُهَن‌بُن</h1>
                <p class="mt-4 text-lg text-slate-300 max-w-xs">
                    به اقتصاد هوشمند ایران بپیوندید
                </p>
                <div class="w-24 h-1 bg-teal-500 mt-8 mb-8 rounded-full"></div>
                <i class="fas fa-user-plus text-8xl text-teal-500 opacity-20"></i>
            </div>

            <!-- Right Panel: Form -->
            <div class="p-8 md:p-12">
                <h2 class="text-3xl font-extrabold text-slate-800 mb-4">ایجاد حساب کاربری جدید</h2>
                <p class="text-slate-500 mb-8">با ثبت نام، به دنیای دارایی‌های دیجیتال قدم بگذارید.</p>
                
                <form id="signup-form" action="#" method="POST" class="space-y-5" novalidate>
                    <div>
                        <label for="fullname" class="block text-sm font-bold text-slate-700 mb-2">نام و نام خانوادگی</label>
                        <input type="text" id="fullname" name="fullname" class="form-input" required>
                    </div>

                    <div>
                        <label for="mobile" class="block text-sm font-bold text-slate-700 mb-2">شماره موبایل</label>
                        <input type="tel" id="mobile" name="mobile" class="form-input" required placeholder="مثال: 09123456789">
                        <p id="mobile-error" class="error-message hidden">شماره موبایل باید ۱۱ رقم و با ۰۹ شروع شود.</p>
                    </div>
                    
                    <div>
                        <label for="password" class="block text-sm font-bold text-slate-700 mb-2">رمز عبور</label>
                        <div class="input-group">
                            <input type="password" id="password" name="password" class="form-input" required>
                            <i class="fas fa-eye input-icon toggle-password"></i>
                        </div>
                        <div class="strength-meter">
                            <div id="strength-bar" class="strength-bar"></div>
                        </div>
                        <p id="password-strength-text" class="text-xs mt-1"></p>
                    </div>

                     <div>
                        <label for="confirm-password" class="block text-sm font-bold text-slate-700 mb-2">تکرار رمز عبور</label>
                        <div class="input-group">
                            <input type="password" id="confirm-password" name="confirm-password" class="form-input" required>
                            <i class="fas fa-eye input-icon toggle-password"></i>
                        </div>
                        <p id="password-error" class="error-message hidden">رمزهای عبور مطابقت ندارند.</p>
                    </div>
                    
                    <div class="flex items-center">
                        <input id="terms" name="terms" type="checkbox" class="form-checkbox" required>
                        <label for="terms" class="mr-2 block text-sm text-slate-900">
                            <a href="#" class="font-semibold text-teal-600 hover:text-teal-700">قوانین و مقررات</a> را مطالعه کرده و می‌پذیرم.
                        </label>
                    </div>
                    
                    <div>
                        <button type="submit" id="submit-button" class="w-full flex justify-center items-center gap-2 py-3 px-4 bg-teal-600 text-white font-bold rounded-lg hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500 transition-all transform hover:-translate-y-1 shadow-lg disabled:bg-slate-400 disabled:cursor-not-allowed">
                            <span id="button-text">ثبت نام</span>
                            <span id="button-spinner" class="spinner hidden"></span>
                        </button>
                    </div>
                </form>
                
                <div class="mt-8 text-center">
                    <p class="text-slate-500">حساب کاربری دارید؟ 
                        <a href="#" class="font-bold text-teal-600 hover:text-teal-700">وارد شوید</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Form Elements
            const signupForm = document.getElementById('signup-form');
            const mobileInput = document.getElementById('mobile');
            const passwordInput = document.getElementById('password');
            const confirmPasswordInput = document.getElementById('confirm-password');
            const submitButton = document.getElementById('submit-button');
            const buttonText = document.getElementById('button-text');
            const buttonSpinner = document.getElementById('button-spinner');
            
            // Error & Info Elements
            const mobileError = document.getElementById('mobile-error');
            const passwordError = document.getElementById('password-error');
            const strengthBar = document.getElementById('strength-bar');
            const strengthText = document.getElementById('password-strength-text');
            const togglePasswordIcons = document.querySelectorAll('.toggle-password');

            // --- Utility Functions ---
            const setInputState = (input, errorElement, isValid, errorMessage) => {
                if (isValid) {
                    input.classList.remove('input-invalid');
                    input.classList.add('input-valid');
                    errorElement.classList.add('hidden');
                } else {
                    input.classList.remove('input-valid');
                    input.classList.add('input-invalid');
                    errorElement.textContent = errorMessage;
                    errorElement.classList.remove('hidden');
                }
            };
            
            // --- Event Listeners ---

            // 1. Mobile Number Validation (Real-time)
            mobileInput.addEventListener('input', () => {
                const mobileRegex = /^09\d{9}$/;
                const isValid = mobileRegex.test(mobileInput.value);
                if (mobileInput.value === "") {
                    mobileInput.className = 'form-input';
                    mobileError.classList.add('hidden');
                } else {
                    setInputState(mobileInput, mobileError, isValid, 'شماره موبایل باید ۱۱ رقم و با ۰۹ شروع شود.');
                }
            });

            // 2. Password Strength Meter (Real-time)
            passwordInput.addEventListener('input', () => {
                const password = passwordInput.value;
                let score = 0;
                if (password.length >= 8) score++;
                if (/[A-Z]/.test(password)) score++;
                if (/[a-z]/.test(password)) score++;
                if (/[0-9]/.test(password)) score++;
                if (/[^A-Za-z0-9]/.test(password)) score++;

                strengthBar.className = 'strength-bar'; // Reset classes
                switch (score) {
                    case 0:
                    case 1:
                    case 2:
                        strengthBar.classList.add('strength-weak');
                        strengthText.textContent = 'ضعیف';
                        strengthText.style.color = '#ef4444'; // red-500
                        break;
                    case 3:
                    case 4:
                        strengthBar.classList.add('strength-medium');
                        strengthText.textContent = 'متوسط';
                        strengthText.style.color = '#f59e0b'; // yellow-500
                        break;
                    case 5:
                        strengthBar.classList.add('strength-strong');
                        strengthText.textContent = 'قوی';
                        strengthText.style.color = '#22c55e'; // green-500
                        break;
                    default:
                        strengthText.textContent = '';
                }
                if (password.length === 0) {
                    strengthText.textContent = '';
                }
                validatePasswordsMatch(); // Also check match when main password changes
            });

            // 3. Password Confirmation (Real-time)
            const validatePasswordsMatch = () => {
                if (confirmPasswordInput.value === "" && passwordInput.value === "") {
                     confirmPasswordInput.className = 'form-input';
                     passwordError.classList.add('hidden');
                     return;
                }
                const doPasswordsMatch = passwordInput.value === confirmPasswordInput.value;
                setInputState(confirmPasswordInput, passwordError, doPasswordsMatch, 'رمزهای عبور مطابقت ندارند.');
            };
            confirmPasswordInput.addEventListener('input', validatePasswordsMatch);

            // 4. Toggle Password Visibility
            togglePasswordIcons.forEach(icon => {
                icon.addEventListener('click', function() {
                    const input = this.previousElementSibling;
                    const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
                    input.setAttribute('type', type);
                    this.classList.toggle('fa-eye');
                    this.classList.toggle('fa-eye-slash');
                });
            });

            // 5. Form Submission
            signupForm.addEventListener('submit', function(e) {
                e.preventDefault(); // Always prevent default to handle via JS

                // Final validation check before submission
                const isMobileValid = /^09\d{9}$/.test(mobileInput.value);
                const doPasswordsMatch = passwordInput.value === confirmPasswordInput.value && passwordInput.value !== '';
                const areTermsAccepted = document.getElementById('terms').checked;
                
                if (!isMobileValid || !doPasswordsMatch || !areTermsAccepted) {
                    // Manually trigger validation display for untouched fields if needed
                    if (!isMobileValid) setInputState(mobileInput, mobileError, false, 'شماره موبایل نامعتبر است.');
                    if (!doPasswordsMatch) setInputState(confirmPasswordInput, passwordError, false, 'رمزهای عبور مطابقت ندارند.');
                    if (!areTermsAccepted) alert('لطفا قوانین و مقررات را بپذیرید.');
                    return;
                }

                // --- Simulate API Call ---
                submitButton.disabled = true;
                buttonText.textContent = 'در حال ارسال...';
                buttonSpinner.classList.remove('hidden');

                setTimeout(() => {
                    // On success:
                    alert('ثبت نام با موفقیت انجام شد!');
                    signupForm.reset();
                    
                    // Reset UI
                    submitButton.disabled = false;
                    buttonText.textContent = 'ثبت نام';
                    buttonSpinner.classList.add('hidden');
                    document.querySelectorAll('.form-input').forEach(input => {
                        input.classList.remove('input-valid', 'input-invalid');
                    });
                    strengthBar.className = 'strength-bar';
                    strengthText.textContent = '';

                }, 2000); // Simulate a 2-second network delay
            });
        });
    </script>

</body>
</html>
